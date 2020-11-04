## Universidad Nacional de Colombia
## Diplomado Ciencia de datos
## Análisis de texto
## Juliana Guerrero

# ruta directorio
setwd('C:/Users/Juliana/Desktop/Diplomado/D_2020/Casos/Casos/TextMining') 


# cargue librerias 
library(tokenizers)
library(tidyverse)
library(tm)
library(stopwords)
library(textstem)
library(wordcloud)
library(textstem)
library(udpipe)
library(dplyr)

## Cargue de datos
tx <- read.csv('tweets.csv')

head(tx)

# tokenizar oraciones
tokenize_sentences(as.character(tx[1,1])) 

# tokenizar palabras
tokenize_words(as.character(tx[2,1]))

# tamaño de los tweets
tx$largo = nchar(as.character(tx$texto))


mean(tx$largo)
min(tx$largo)
max(tx$largo)

hist(tx$largo)




## tokens mas frecuentes
palabras <- paste(tx$texto,collapse='\n')
words <- tokenize_words(palabras,lowercase = FALSE, strip_numeric = FALSE,strip_punct = FALSE)
asdf<-table(words)
tab <- tibble(word = names(asdf), count = as.numeric(asdf))
arrange(tab,desc(count))

# to lower 
as.character(tx[1,1])
tolower(as.character(tx[1,1]))

# caracteres especiales
gsub('[@w+|#]','',as.character(tx[1,1]))

# puntuación 
gsub('[[:punct:] ]+',' ',as.character(tx[1,1]))
removePunctuation(as.character(tx[1,1])) # librería tm

# frecuencias con modificaciones 
words <- tokenize_words(palabras,lowercase = TRUE, strip_numeric = FALSE,strip_punct = TRUE)
asdf<-table(words)
tab <- tibble(word = names(asdf), count = as.numeric(asdf))
arrange(tab,desc(count))

## stopwords
stopwords::stopwords("es")

# con tm 
tx$texto_l <- removeWords(as.character(tx$texto),stopwords("spanish"))
palabras <- paste(tx$texto_l,collapse='\n')
words <- tokenize_words(palabras,lowercase = TRUE, strip_numeric = FALSE,strip_punct = TRUE)
asdf<-table(words)
tab <- tibble(word = names(asdf), count = as.numeric(asdf))
arrange(tab,desc(count))

# con la funcion tokenize_words
palabras <- paste(tx$texto,collapse='\n')
words <- tokenize_words(palabras,lowercase = TRUE, strip_numeric = FALSE,strip_punct = TRUE,stopwords = stopwords::stopwords("es"))
asdf<-table(words)
tab <- tibble(word = names(asdf), count = as.numeric(asdf))
arrange(tab,desc(count))


## ngrams
# bigram
test <- tokenize_ngrams(palabras,n=2,lowercase = TRUE,stopwords = stopwords::stopwords("es"))
pre <- table(test)
tab <- tibble(ngram = names(pre), count = as.numeric(pre))
arrange(tab,desc(count))


# trigram
test <- tokenize_ngrams(palabras,n=3,lowercase = TRUE,stopwords = stopwords::stopwords("es"))
pre <- table(test)
tab <- tibble(ngram = names(pre), count = as.numeric(pre))
arrange(tab,desc(count))



#  atriz tdm
corp <- Corpus(VectorSource(as.character(tx$texto)))
tdm <- as.matrix(DocumentTermMatrix(corp,control = list(removePunctuation = TRUE,stopwords = TRUE)))
tdm[1:10,1:15]

# wordcloud
corp <- corp %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
corp <- tm_map(corp, content_transformer(tolower))
corp <- tm_map(corp, removeWords, stopwords("spanish"))


dtm <- TermDocumentMatrix(corp) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

set.seed(1234) # for reproducibility 
wordcloud(words = df$word, freq = df$freq, min.freq = 5,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))


# lemmatize

vector <- c("trouble", "troubling", "troubled")
lemmatize_words(vector)
vector <- c("corria", "corre", "corren")
lemmatize_words(vector)

# pos

## english 
sent <- c("Juliana is having a good day")
df <- data.frame(sent, stringAsFactors = FALSE)
udmodel <- udpipe_download_model(language = "english")
udmodel <- udpipe_load_model(file = udmodel$file_model)


x <- udpipe_annotate(udmodel,df$sent)
x <- as.data.frame(x)
x %>% select(token, upos)

# spanish
sent <- c("Juliana tiene un buen día")
df <- data.frame(sent, stringAsFactors = FALSE)


udmodel <- udpipe_download_model(language = "spanish")
udmodel <- udpipe_load_model(file = udmodel$file_model)


x <- udpipe_annotate(udmodel,df$sent)
x <- as.data.frame(x)
x %>% select(token, upos)


