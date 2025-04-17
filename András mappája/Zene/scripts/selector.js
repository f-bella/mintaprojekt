
    const selector = document.querySelector(".selector")
    let selected = "getSong"

    selector.addEventListener("change",()=>{
        selected = selector.value
    })