const render  =  (obj) =>{
    console.log(obj)
    const section =  document.querySelector(`#${obj.sectionId}`)
    
    obj.dataSet.forEach(itm=>{
        const wikiUrl = itm.wikiUrl ==  null ? "" : `<a class="btn-link" target="${itm.title}" href="${itm.wikiUrl}">Wiki</a>`
        section.innerHTML += `
            <div class="box ${itm.size}">
                <div class="box-content">
                    <div class="box-body container">
                        <div class="w-25 text-center">
                            <img class="img" src="${itm.imgUrl}"> 
                        </div>
                        <div class="w-75">
                            <div class="p-2">
                                <h1>${itm.title}</h1>
                                <div>${itm.content}</div>
                                ${wikiUrl}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `
    })



}





