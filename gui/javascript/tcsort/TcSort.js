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
                methods  : ['sortFilter'],
                listener : null
            },
        

        ]
        
        this.addNeedEvents();
    }

    async sortFilter()
    {
        for (const key in this.filtersEl) 
        {
            if(Object.keys(this.filters).includes(key))
            {
                this.filters[key] = this.filtersEl[key].value;
            }    
        }


        await this.sendRequest(this.filters,'/testcase/sorted');
        this.sortTestCase();

    }

    sortTestCase()
    {
        let testCasesBody = document.getElementById('item_view');
        testCasesBody = testCasesBody.querySelector("tbody");
        if (testCasesBody instanceof Element) 
        {        
            const sortedTestCases = document.createDocumentFragment();
        
            this.response.data.forEach(sortedTestCase => 
            {
                let lastTestCase = testCasesBody.querySelector(`[name="tcaseSet[${sortedTestCase.id}]"]`);
        
                if (lastTestCase instanceof Element)
                {
                    lastTestCase = lastTestCase.closest('tr');
                    sortedTestCases.appendChild(lastTestCase); 
                }
            });
        
            this.removeChild(testCasesBody);
            testCasesBody.appendChild(sortedTestCases); 
        }
    }
   


}


new TcSort();

