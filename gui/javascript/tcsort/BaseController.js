
class BaceController
{
    selectedElement = null;
    loadingElement = null;
    events = [];
    filtersEl
    response;
    data = null;
    filters = {};
    config
    constructor()
    {
        this.config = 
        {
            baseRoute : '',
            apiKey    : document.getElementById('apiKey').value
        };
    }

    
    removeChild(parent,targetChild = null)
    {
        if(parent instanceof Element)
        {
            if(targetChild != null)
            {
                targetChild = targetChild instanceof NodeList ? targetChild : [targetChild];
                targetChild.forEach((child)=>
                {
                    parent.removeChild(child);
                });
                
                return true;
            }
            
            while(parent.firstChild)
            {
                parent.removeChild(parent.firstChild)
            }
        }

        return this;
    }
    

    loading()
    {
        this.selectedElement = this.loadingElement;
        
        return this;
    }
    
    getSelectionOption(select)
    {
        return select.options[select.selectedIndex];
    }

    addNeedEvents(targetEvents = [])
    {
        this.events.forEach((item,index)=>
        {
            if( targetEvents.includes(index)  || targetEvents.length == 0 )
            {
                const target = item.getType == 'single' ? [item.target] : item.target ;


                if(item.listener == null)
                {
                    const listener = (e)=>
                    {
                        item.methods.forEach( method => 
                        {
                            eval("this." + method + '(e)');
                        });
                    }

                    target.forEach((element)=>
                    {
                        if(element != null)
                        {
                            element.addEventListener(item.type,listener)
                        }
                    });
                    item.listener = listener
                }
            
            }

        });
    }
    removeNeedEvents(targetEvents = [])
    {

        this.events.forEach((item,index)=>
        {

            if( targetEvents.includes(index) || targetEvents.length == 0 )
            {
                const target = item.getType == 'single' ? [item.target] : item.target ;

                if(item.listener != null)
                {
                    target.forEach((element)=>
                    {
                        if(element != null)
                        {
                            element.removeEventListener(item.type,item.listener);
                        }
                    });
                    item.listener = null;
                }
            }
        
        });
        
    }
    
    async sendRequest(data, method) {  
        this.loading().show();  
    
        try {  
            const response = await fetch(this.config.baseRoute, {  
                method: 'POST',  
                headers: {  
                    'X-API-Key': this.config.apiKey,  
                    'Content-Type': 'application/json'  
                },  
                body: JSON.stringify({  
                    data
                })  
            });  
    
            const jsonResponse = await response.json();  
            console.log(jsonResponse);  
    
            if (jsonResponse.status) {  
                console.log('success');
            }  
        } catch (error) {  
            console.log('error: ', error);  
        } finally 
        {  
            ///this.loading().close();  
        }  
    }

}

export{BaceController};
