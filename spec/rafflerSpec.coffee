describe "Raffler View", ->
  @collection = view = undefined
  beforeEach ->
    @collection = new Raffler.Collections.Entries()
    @collection.fetch()
    view = new Raffler.Views.EntriesIndex(collection: @collection)
  
  it "should have add function defined", ->
    expect(view.newName).toBeDefined();
  
  it "should add new model to raffler view", ->
    view.newName('Parth')
    expect(@collection.size()).toEqual(1);

  it "should have function to set model to true", ->
    expect(view.setTrue).toBeDefined();
  
  it "sets the model to true", ->
    item=@collection.find (@model) ->
      @model.get("name") is 'Parth'
      #@model
    view.setTrue(item)
    expect(item.get("winner")).toEqual(true);

  it "should have save funciton defined", ->
    expect(view.saveModel).toBeDefined();
    
  it "should have function to set model to false", ->
    expect(view.setFalse).toBeDefined();

  it "sets the model to false", ->
    item=@collection.find (@model) ->
      @model.get("name") is 'Parth'
      #@model
    view.setFalse(item)
    expect(item.get("winner")).toEqual(false);

  it "should have delete function defined", ->
    expect(view.delItem).toBeDefined();

  it "should delete model from raffler", ->
    item=@collection.find (@model) ->
      @model.get("name") is 'Parth'
      #@model
    view.delItem(item)
    expect(@collection.size()).toEqual(0);