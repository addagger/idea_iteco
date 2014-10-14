$(function() {
  set_summer_note($('.summernote'));
});

$(function() {
	set_summer_note_media($('.summernote-media'));
});

function set_summer_note(summer_note) {
  return summer_note.summernote({
    height: 200,
    toolbar: [["style", ["style"]], ["style", ["clear"]], ["table", ["table"]], ["fontname", ["fontname"]], ["fontsize", ["fontsize"]], ["color", ["color"]], ["style", ["bold", "italic", "underline", "strikethrough"]], ["para", ["ul", "ol", "paragraph"]], ["height", ["height"]], ["view", ["fullscreen", "codeview"]], ["help", ["help"]]]
  });
}

function set_summer_note_media(summer_note) {
  return summer_note.summernote({
    height: 300,
    toolbar: [["style", ["style"]], ["style", ["clear"]], ["table", ["table"]], ["fontname", ["fontname"]], ["fontsize", ["fontsize"]], ["color", ["color"]], ["style", ["bold", "italic", "underline", "strikethrough"]], ["para", ["ul", "ol", "paragraph"]], ["height", ["height"]], ["insert", ["link", "picture", "video", "hr"]], ["view", ["fullscreen", "codeview"]], ["help", ["help"]]],
    onImageUpload: function(files, editor, welEditable) {
        sendFile(files[0], editor, welEditable);
    }
  });
}

function sendFile(file,editor,welEditable) {
  data = new FormData();
  data.append("upload[src]", file);
	data.append("upload[origin]", "editor");
  console.log('image upload:', file, editor, welEditable);
  console.log(data);
  $.ajax({
    data: data,
		dataType: "json",
    type: "POST",
    url: "/uploads",
    cache: false,
    contentType: false,
    processData: false,
    success: function(data) {
      editor.insertImage(welEditable, data.files[0].wideUrl);
    }
  });
}
// #
// #
// # $ ->
// #
// #   # to set summernote object
// #   # You should change '#post_content' to your textarea input id
// #   summer_note = $('.summernote')
// #
// #   # to call summernote editor
// #   summer_note.summernote
// #     # to set options
// #     height: 300
// #     toolbar: [
// #                 ["style", ["style"]],
// #                 ["style", ["clear"]],
// #                 ["table", ["table"]],
// #                 ["fontname", ["fontname"]],
// #                 ["fontsize", ["fontsize"]],
// #                 ["color", ["color"]],
// #                 ["style", ["bold", "italic", "underline", "strikethrough"]],
// #                 ["para", ["ul", "ol", "paragraph"]],
// #                 ["height", ["height"]],
// #                 ["insert", ["link", "picture", "video", "hr"]],
// #                 ["view", ["fullscreen", "codeview"]],
// #                 ["help", ["help"]]
// #              ]
// #
// #   # to set code for summernote
// #   # this.code this.val()
// #
// #   # to get code for summernote
// #   # summer_note.closest('form').submit ->
// #   #   # alert $('#post_content').code()[0]
// #   #   summer_note.val summer_note.code()
// #   #   true