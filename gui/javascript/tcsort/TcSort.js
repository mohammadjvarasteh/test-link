import { BaceController } from "./BaseController.js";
class TcSort extends BaceController
{
    selectedElement = null;
    loadingElement = null;
    events = [];
    filtersEl
    response;
    data = null;
    filters = 
    {
        typeFilter : null,
        arrangement: null
    }
    constructor()
    {
        super();
        this.filtersEl =
        {
            runBtn      : document.getElementById('run_filter'),
            typeFilter  : document.getElementById('type_filter'),
            arrangement : document.getElementById('arrangement'),
        }

        this.events = 
        [
            {
                target   : this.filtersEl.runBtn,
                getType  : 'single',
                type     : 'click',
                methods  : ['sortFilter','sendRequest'],
                listener : null
            },
        

        ]
        
        this.addNeedEvents();
    }

    sortFilter()
    {
        for (const key in this.filtersEl) 
        {
            if(Object.keys(this.filters).includes(key))
            {
                this.filters[key] = this.filtersEl[key].value;
            }    
        }

    }
   


}


new TcSort();

