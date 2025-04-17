const events = () =>{
    const artist = document.querySelectorAll(".artist")
    artist.forEach(itm=>{
        itm.addEventListener("click",()=>{
            getInfo(itm.textContent)
        })
    })



}