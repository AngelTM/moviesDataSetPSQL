import pandas as pd

creditos=pd.read_csv("credits.csv")
creditos=pd.DataFrame(creditos)

longitud=len(creditos)

DFCreditosCrewMovie=pd.DataFrame()
DFCrew=pd.DataFrame()
dtNames=[]
dtJobs=[]
dtIDcrew=[]
dtID=[]

for i in range(0,longitud):
    actores=creditos.iloc[i]['cast']
    crew=creditos.iloc[i]['crew']
    idMov=creditos.iloc[i]['id']
    actores=eval(actores)
    crew=eval(crew)
    if len(actores)!=0:
        for j in range(0,len(actores)):
            dato=(actores[j])
            name=dato['name']
            idActor =dato['id']
            dtNames.append(name)
            dtIDcrew.append(idActor)
            dtJobs.append('Actor')
            dtID.append(idMov)
    if len(crew)!=0:
        for j in range(0,len(crew)):
            dato2=(crew[j])
            name=dato2['name']
            job=dato2['job']
            idCrew =dato2['id']
            dtIDcrew.append(idCrew)
            dtNames.append(name)
            dtJobs.append(job)
            dtID.append(idMov)    

DFCreditosCrewMovie.insert(0,'id_crew',dtIDcrew,True)
DFCreditosCrewMovie.insert(1,'id_Movie',dtID,True)
DFCreditosCrewMovie.insert(2,'job',dtJobs,True)

DFCreditosCrewMovie.to_csv("PCreditsMovies.csv", index= False)

DFCrew.insert(0,'id_crew',dtIDcrew,True)
DFCrew.insert(1,'name_crew',dtNames,True)
DFCrew.drop_duplicates(subset=None, keep="first", inplace=True)
DFCrew.to_csv("PCredits.csv", index= False)