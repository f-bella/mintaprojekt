const {Home} = await import(`../../Views/Home/Home.js${appVersion}`)
const {About} = await import(`../../Views/About/About.js${appVersion}`)
const {Er404} = await import(`../../Views/Er404/Er404.js${appVersion}`)
const {Minta} = await import(`../../Views/Minta/Minta.js${appVersion}`)
export const PATH = {
    "":      { title:"Főoldal", fnc:Home},
    "#":     { title:"Főoldal", fnc:Home},
    "#home": { title:"Főoldal", fnc:Home},
    "#about":{ title:"Rólunk",  fnc:About},
    "#er404":{ title:"404",  fnc:Er404},
    "#minta":{ title:"Minta",  fnc:Minta},
}

/*
loginNeeded:false
athRequired:[1,2,3]
*/