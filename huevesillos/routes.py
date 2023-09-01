from fastapi import APIRouter, UploadFile, File
from fastapi.responses import HTMLResponse
from uuid import uuid4
from trataima import img, imgw


ruta = "huevesillos/imagenesr/"

router = APIRouter()
@router.post("/subir/", tags=["Subida de Archivos"])
async def upload_huevos(file:UploadFile =File(...)):
    file.filename = f"{uuid4()}.jpg"
    recibido = await file.read()
    with open(f"{ruta}{file.filename}", "wb") as huevesillor:
        huevesillor.write(recibido)
        huevesillor.close()
        l = img(ruta + file.filename)
        l2 = imgw(ruta+ file.filename)  
        l2.wather()  
    return l.trar()
#Se termina el tratamiento de imagenes y se guardan
   
   