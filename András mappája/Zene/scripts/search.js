    const song = document.querySelector(".song")
    const result = document.querySelector(".result")

    song.addEventListener("keyup",()=>{
        const ajaxResult = Ajax({
                            url:"./request.php",
                            response:"json",
                            method:"post",
                            data:{
                                procedure: selected,
                                parameters:`'${song.value}'`
                            }
                        })
        

        result.innerHTML = ""
        ajaxResult.forEach(itm=>{
            result.innerHTML += `
                                <div>
                                    ${ itm.song == null ? "" : `<b>${itm.song}</b> -> `}
                                    
                                    <span class="artist">${itm.artist}</div>

                                    ${ itm.genre == null ? "" : ` -> <b>${itm.genre}</b>`}
                                   
                                </div>`
        })
        events()
    })