
<%@ page import="upload.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.handsontable.full.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.handsontable.full.css')}"
	type="text/css">
		
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-book" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="auther" title="${message(code: 'book.auther.label', default: 'Auther')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookInstanceList}" status="i" var="bookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "auther")}</g:link></td>
					
						<td>${fieldValue(bean: bookInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookInstanceTotal}" />
			</div>
		</div>
		
          <button name="save">Save</button>
     

    <div id="example1"></div>
        <script>
          var $container = $("#example1");
          var $console = $("#example1console");
          var $parent = $container.parent();
          var autosaveNotification;
          $container.handsontable({
            startRows: 8,
            startCols: 6,
            rowHeaders: true,
            colHeaders: true,
            minSpareRows: 1,
            contextMenu: true,
            colHeaders: ["Nachiket", "Hrishi", "Tanmay" ,"Sumedh" , "abchd", "aslkdfjl"],
          });
          var handsontable = $container.data('handsontable');

          var rowList = handsontable.getData()
          $parent.find('button[name=save]').click(function () {
            $.ajax({
              url: "http://localhost:8080/upload/book/upload",
              dataType: "json",
              data: {data: JSON.stringify(rowList)}, //returns all cells' data
              type: 'POST',
            });
          });
        </script>
     
	</body>
</html>
