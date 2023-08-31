from fastapi import APIRouter, UploadFile, File
from fastapi.responses import HTMLResponse
from uuid import uuid4
from trataima import img


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
    return l.trar()
   
   