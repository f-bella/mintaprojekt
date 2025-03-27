const apiKey	            =   "b5741443affa99d629156cfd50a24b0a"
const Shared_secret       =	"265c540e30d1f097f9c20d8929695487"

const details = document.querySelector(".details")

const getInfo = (artist) =>{
    const url = `http://ws.audioscrobbler.com/2.0/?method=artist.getInfo&artist=${artist}&api_key=${apiKey}&format=json`;
    fetch(url)
    .then(response => {
        if (!response.ok) {
            throw new Error('Hiba történt a kérés során')
        }
        return response.json()
    })
    .then(data => {
        if(data.error == null){

            let tagList = ""
            data.artist.tags.tag.forEach(tag=>{
                tagList += `<div><i>${tag.name}</i></div>`
            })


            let similarBandList = ""
            data.artist.similar.artist.forEach(band=>{
                similarBandList += `<div>
                                        <a target="${band.name}" href="${band.url}">
                                            <i>${band.name}</i>
                                        </a>
                                    </div>`
            })


            details.innerHTML = `
            <div><b>Előadó:</b></div>
            <div>${data.artist.name}</div>

            <div style="margin-top:20px;"><b>Alakulás éve:</b></div>
            <div>${data.artist.bio.published}</div>

            <div style="margin-top:20px;"><b>Részletek:</b></div>
            <div>${data.artist.bio.content}</div>

            <div style="margin-top:20px;"><b>Éppen turnézik:</b></div>
            <div>${data.artist.ontour == 0 ? "Nem" : "Igen"}</div>

            <div style="margin-top:20px;"><b>Kategóriák:</b></div>
            <div>${tagList}</div>

            <div style="margin-top:20px;"><b>Hasonló együttesek:</b></div>
            <div>${similarBandList}</div>

            `

            
            console.log( data.artist)
        }
        else{
            return data.message
            
        }
    })
    .catch(error => {
        document.write('Hiba:', error)
    })
}