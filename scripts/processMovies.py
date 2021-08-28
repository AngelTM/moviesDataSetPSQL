import pandas as pd

movies=pd.read_csv("movies_metadata.csv")
movies=pd.DataFrame(movies)
longitud=len(movies)

DFpeliculas=pd.DataFrame()
dtID=[]
dtNames=[]
dtVotes=[]

DFgenresMovies=pd.DataFrame()
DFgenres=pd.DataFrame()
dtGID=[]
dtGNames=[]
dtIDMovie=[]
dtCal=[]

for i in range(0,longitud):
    genres=movies.iloc[i]['genres']
    idMov=movies.iloc[i]['id']
    names=movies.iloc[i]['title']
    vote = movies.iloc[i]['vote_count']
    cal = movies.iloc[i]['vote_average']
    genres=eval(genres)
    if len(genres)!=0:
        for j in range(0,len(genres)):
            dato=(genres[j])
            name=dato['name']
            gID =dato['id']
            dtGID.append(gID)
            dtGNames.append(name)
            dtIDMovie.append(idMov)

    dtID.append(idMov)
    dtNames.append(names)
    dtVotes.append(vote)
    dtCal.append(cal)
DFpeliculas.insert(0,'id_movie',dtID,True)
DFpeliculas.insert(1,'titulo',dtNames,True)
DFpeliculas.insert(2,'calificacion',dtCal,True)
DFpeliculas.insert(3,'votes',dtVotes,True)

DFpeliculas.drop_duplicates(subset=None, keep="first", inplace=True)
DFpeliculas.to_csv("Pmovies.csv", index= False)

DFgenresMovies.insert(0,'id_genre',dtGID,True)
DFgenresMovies.insert(1,'id_movie',dtIDMovie,True)
DFgenresMovies.to_csv("PgenresMovies.csv", index= False)

DFgenres.insert(0,'id_genre',dtGID,True)
DFgenres.insert(1,'name',dtGNames,True)
DFgenres.drop_duplicates(subset=None, keep="first", inplace=True)
DFgenres.to_csv("Pgenres.csv", index= False)



