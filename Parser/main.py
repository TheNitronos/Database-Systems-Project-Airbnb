import clean_and_insert_reviews as reviews
import clean_and_insert_listings as listings
import pandas as pd
import os

import csv_tokenizer as tok

reviews_files = ["barcelona_reviews.csv", "berlin_reviews.csv", "madrid_reviews.csv"]
reviews_files = ["../Dataset/" + file for file in reviews_files]

listings_files = ["barcelona_listings.csv", "madrid_listings_filtered.csv", "berlin_listings_filtered.csv"]
listings_files = ["../Dataset/" + file for file in listings_files]



for filename in reviews_files :
    reviews.insert_reviews_reviewers(filename)

listings.create_insert_queries(listings_files)

print("begin main checks")
for filename in os.listdir('insert'):
    if filename != ".DS_Store":
        filename = "insert/" + filename
        print("check if columns size equal values line size for : " + filename)
        columns, values = tok.tokenize(filename)
        if len(columns) != len(values[0]):
            print("# columns = ", len(columns), " and values first line size = ", len(values[0]), " for file : ", filename)
