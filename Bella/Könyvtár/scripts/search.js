    const song = document.querySelector(".title")
    const result = document.querySelector(".result")

    song.addEventListener("keyup",()=>{
        const ajaxResult = Ajax({
                            url:"./request.php",
                            response:"json",
                            method:"post",
                            data:{
                                procedure: selected,
                                parameters:`'${title.value}'`
                            }
                        })
        

        result.innerHTML = ""
        ajaxResult.forEach(itm=>{
            result.innerHTML += `
                                <div>
                                    ${ itm.title == null ? "" : `<b>${itm.title}</b> -> `}
                                    
                                    ${itm.writer}

                                    ${ itm.genre == null ? "" : ` -> <b>${itm.genre}</b>`}
                                   
                                </div>`
        })

    })