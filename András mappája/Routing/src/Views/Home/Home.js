const {Dropdown} = await import(`./Components/Dropdown/Dropdown.js${appVersion}`)

export class Home{
    constructor(props){    }
    init(){
        return `<h1>Én vagyok a főoldal</h1>
        <div>${Dropdown()}</div>`
    }
    events(){}
}