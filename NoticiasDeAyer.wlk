class Publicacion{
    const property fechaPublicacion
    const property autor
    const gradoImportancia
    const property desarrolloNoticia

    method gradoImportancia() = aux.min(10,aux.max(gradoImportancia,1))

    method esCopada() = gradoImportancia > 8 and fechaPublicacion - dia.fechaActual() and self.cumplir()

    method cumplir()
}

class Noticia inherits Publicacion{
    var property tipoNoticia

    override method cumplir() = tipoNoticia.cumplir()
}

class Chivo{
    const property plataRecibida

    method cumplir() = plataRecibida > 2000000 
}

class Articulo inherits Publicacion{
    var property tipoArticulo

    override method cumplir() = tipoArticulo.cumplir()
}

class ArticuloComun{
    const property links
    
    method cumplir() = links.size() >= 2
}

class Reportaje inherits Publicacion{
    var property entrevistado

    override method cumplir() = entrevistado.size() % 2 == 1
}

class Cobertura inherits Publicacion{
    var property noticias

    override method cumplir() = noticias.all{noticia => noticia.esCopada()}
}


object aux{
    method min(a,b){if(a>b)return b else return a}
    method max(a,b){if(a>b)return a else return b}
}

object dia{
    const property fechaActual = 09122024
}

// periodistas
class Periodista{
    const property fechaIngreso
    const property tipoPeriodista

    
}

object periodistaNoticiasCopadas{
    method publicar(noticias) = noticias.filter{noticia => noticia.esCopada()}
}

object periodistaSencionalista{
    const listaSencionalista1 = ["Dibu Martinez","espectacular","increible","grandioso"]
    const listaSencionalista2 = ["espectacular","increible","grandioso"]
    
    method publicar(noticias) = noticias.filter{noticia => if(noticia.esReportaje()){
    listaSencionalista1.any{palabra => noticias.desarrolloNoticia().contains(palabra)}}
    else{listaSencionalista2.any{palabra => noticias.desarrolloNoticia().contains(palabra)}}}
}

object periodistaVago{
    method publicar(noticias) = noticias.filter{noticia => noticia.esChivo() || noticia.desarrolloNoticia().size() < 100}
}

object joseDeZer{
    method publicar(noticias) = noticias.filter{noticia => noticia.desarrolloNoticia().first() == "T"}
}