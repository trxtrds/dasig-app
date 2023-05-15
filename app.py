from flask import Flask, render_template, request
import pickle
import numpy as np
import re
from string import punctuation
import nltk
from nltk.stem import PorterStemmer, WordNetLemmatizer
import tensorflow as tf
from tensorflow.keras.preprocessing.sequence import pad_sequences
from keras.preprocessing.text import tokenizer_from_json
import json


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def home():

    ps = PorterStemmer()

    class CleanData (object):

        def __init__(self):
            self.punctuations = punctuation
            self.stopwords = nltk.corpus.stopwords.words('english')
            self.ps = PorterStemmer()
            self.lm = WordNetLemmatizer()
            self.no_punc = ''
            self.words = []
    

        def remove_emoji(self, text):
            emoji_pattern = re.compile("["
                            u"\U0001F600-\U0001F64F"  # emoticons
                            u"\U0001F300-\U0001F5FF"  # symbols & pictographs
                            u"\U0001F680-\U0001F6FF"  # transport & map symbols
                            u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
                            u"\U00002702-\U000027B0"
                            u"\U000024C2-\U0001F251"
                            "]+", flags=re.UNICODE)
            return emoji_pattern.sub(r'', text)
        
        
        def remove_url(self, text): 
            url_pattern  = re.compile('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
            return url_pattern.sub(r'', text) # converting return value from list to string
    
        def remove_punctuations(self, answer):
            self.no_punc ="".join([c for c in answer if c not in self.punctuations])
            self.word_tokenize()
        
        
        def word_tokenize(self):
            self.words = re.split('\W+', self.no_punc)
            self.remove_stopwords()
        
        def remove_stopwords(self):
            self.words = [word for word in self.words if word not in self.stopwords]
            
        # def porter_stemming(self):
        #     self.words = [self.ps.stem(word) for word in self.words]
        
        def word_lemmatize(self):       
            self.words = [self.lm.lemmatize(word ,pos = "v") for word in self.words]
            
        def clean_data(self, answer):
            no_emoji = self.remove_emoji(answer)
            no_url = self.remove_url(no_emoji)
            
            self.remove_punctuations(no_url.lower())
            self.word_lemmatize()
            return "".join([c+" " for c in self.words])


    def load_tokenizer(tokenizer_path):
        with open(tokenizer_path, "r") as tokenizer_file:
            tokenizer_json = tokenizer_file.read()
            tokenizer = tokenizer_from_json(tokenizer_json)
        return tokenizer

    def load_model(file_path):
        with open(file_path, 'rb') as file:
            model_dict = pickle.load(file)
        
        model_architecture = model_dict['architecture']
        model_weights = model_dict['weights']
        
        model = tf.keras.models.model_from_json(model_architecture)
        model.set_weights(model_weights)
        
        return model



    display_text = None
    if request.method == 'POST':
        # file_path = os.path.join(os.getcwd(), 'flask\mood_model23.pkl')
        model = load_model('mood_model23.pkl')

        user_input = request.form.get('mood_text')
        
        # 1. preprocess
        clean = CleanData()
        transformed_text = clean.clean_data(user_input)


        #2. # Preprocess the user input
        tokenizer_path = "tokenizers\\tokenizer23.json"  # Path to your tokenizer JSON file
       
        # Load tokenizer configuration from JSON file
        with open('tokenizer23.json', "r") as file:
            tokenizer_config = json.load(file)
       
        tokenizer = tokenizer_from_json(tokenizer_config)
        sequence = tokenizer.texts_to_sequences([transformed_text])
        padded_sequence = pad_sequences(sequence, maxlen=100)  # Adjust maxlen as per your model's input length
        

        # 3. predict
        prediction_res = model.predict(padded_sequence)
        print(prediction_res)

        # 4. Display
        max_index = np.argmax(prediction_res)
        max_val = round(np.max(prediction_res) * 100, 2)
        sentiment = ''

        if max_index == 0:
            sentiment = "NEGATIVE"
           
        elif max_index == 1:
            sentiment = "NEUTRAL"
           
        elif max_index == 2:
            sentiment = "POSITIVE"
        
        display_text = f'{user_input}  -->  {sentiment} = {max_val}%'
    
    return render_template('index.html', display_text=display_text)


if __name__ == "__main__":
    app.run(debug=True)