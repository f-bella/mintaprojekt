const {PATH} = await import(`../PATH/PATH.js${appVersion}`)
const {Navigator} = await import(`../Navigator/Navigator.js${appVersion}`)
export const ROUTER = () =>{
    const navMenu = document.querySelector("#navMenu")
    const content = document.querySelector("#content")
        
    const hash = location.hash    
    const currentPage = PATH[hash] == null ? new PATH["#er404"].fnc() :  new PATH[hash].fnc()

    navMenu.innerHTML = Navigator
    content.innerHTML = currentPage.init()
    
}

ROUTER()
addEventListener("hashchange", () => {
    ROUTER()
})
