
Template.Dropzone.helpers({

  hasFile: -> Session.get("hasFile")
  submitting: -> Session.get("submitting")

})


Template.Dropzone.events({
  "dropped #dropzone": (event, template) ->
    Apollos.fs.parse(event, (file) ->

      newFile = Apollos.fs.file(file)
      Template.Dropzone.file = newFile
      Session.set("hasFile", true)
    )

})

class ad extends Apollos.Component
  @register "ad"

  vars: -> [
    service: null
    file: null
  ]

  onRendered: ->
    Session.set("submitting", false)
    Session.set("hasFile", false)


  events: -> [

    "submit form": @.submitForm

  ]

  submitForm: (event) ->

    self = @
    event.preventDefault()

    children = {}
    for child in self.children()
      data = child.data()
      if not data.name
        continue

      children[data.name] = child

    email = self.find("input[name=email]").value.toLowerCase()

    if not Apollos.validate.isEmail email
      children["email"].setStatus true
      return

    file = Template.Dropzone.file

    if not file
      children["email"].setStatus "Please upload a file", true
      return

    ###

      we have a valid email and a file. So now we upload the file and create
      an entry in the inquiries table with the following schema

      {
        email: email
        file: file
      }

    ###

    Apollos.fs["uploads"].insert(file, (err, fileObj) ->

      if err
        throw new Apollos.Error err
        return

      Apollos.inquiries.insert({
        email: email
        file: file._id
      })

      Session.set("submitting", true)
      Session.set("hasFile", false)

      setTimeout ->
        Session.set("submitting", false)
        Apollos.fs.uploadQueue.reset()
      , 5000

    )



  onCreated: ->

    service = @.data().active

    @.service.set(service)


  mockData: ->

    service = @.service.get().replace(" ", "-")

    mocks = {}

    mocks["screen-printing"] =
      image: "5-tees.jpg"
      title: "We are designers"
      copy: "Have a great idea but need help fleshing it out? We have a phenomenal team of designers and we would love to help!"
      cta:
        type: "button"
        copy: "Meet our designers"
        link: "#team"

    mocks["letterpress"] =
      image: "screen2.b&w.jpg"
      title: "We are printers"
      copy: "Have a great idea but need help fleshing it out? We have a phenomenal team of designers and we would love to help!"
      cta:
        type: "button"
        copy: "Meet our printers"
        link: "#team"

    mocks["custom-printing"] =
      image: "screen1.b&w.jpg"
      title: "Custom Design"
      copy: "We are great at all kinds of print. Yes, including long form. Have an awesome banner you want printed? We can help."
      cta:
        type: "upload"
        copy: "Send Artwork"
        link: "#"


    return mocks[service]


  # removeDOMElement: (parent, node) ->
  #
  #   width = $(window).width()
  #   height = $(window).height()
  #
  #   # fade out background
  #   $(node).velocity "fadeOut",
  #     duration: 250
  #     complete: (elements) ->
  #       $(node).remove()
