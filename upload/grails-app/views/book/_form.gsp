<%@ page import="upload.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'auther', 'error')} ">
	<label for="auther">
		<g:message code="book.auther.label" default="Auther" />
		
	</label>
	<g:textField name="auther" value="${bookInstance?.auther}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${bookInstance?.title}"/>
</div>

