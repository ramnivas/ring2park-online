<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<security:authorize ifAllGranted="ROLE_ADMIN">

	<h2 class="alt">Add Account</h2>
	
	<div class="span-24 last">
		<div id="errors" class="span-22 last">
			<spring:hasBindErrors name="user">
				<div class="error">
					<spring:bind path="user.*">
						<c:forEach items="${status.errorMessages}" var="error">
							<c:out value="${error}"/><br>
						</c:forEach>
					</spring:bind>
				</div>
			</spring:hasBindErrors>
		</div>
		<spring:url var="addUrl" value="/users/"/>
		<form:form action="${addUrl}" method="put" modelAttribute="user" >
			<div>
				<div class="span-6">
					<label for="name">Username:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:input id="username" path="username" maxlength="40" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration(
						{
							elementId : "username",
							widgetType : "dijit.form.ValidationTextBox",
							widgetAttrs : {
								required : true,
								regExp : "[a-zA-Z0-9]{4,50}",
								invalidMessage : "Username must be alphanumeric and at least 4 characters.",
								trim: true
							}
						}));
					</script>
				</div>
			</div>
			<div>
				<div class="span-6">
					<label for="name">Name:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:input id="name" path="name" maxlength="40" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration(
						{
							elementId : "name",
							widgetType : "dijit.form.ValidationTextBox",
							widgetAttrs : {
								required : true,
								regExp : "[a-zA-Z0-9 ]{6,50}",
								invalidMessage : "Name must be at least 6 characters",
								trim: true
							}
						}));
					</script>
				</div>
			</div>
			<div>
				<div class="span-6">
					<label for="password">Password:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:input type="password" id="password" path="password" maxlength="40" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration(
						{
							elementId : "password",
							widgetType : "dijit.form.ValidationTextBox",
							widgetAttrs : {
								required : true,
								regExp : "[a-zA-Z0-9]{6,50}",
								invalidMessage : "Password must be alphanumeric with no spaces and at least 6 characters",
								trim: true
							}
						}));
					</script>
				</div>
			</div>
			<div>
				<div class="span-6">
					<label for="email">Email:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:input id="email" path="email" maxlength="40" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration(
						{
							elementId : "email",
							widgetType : "dijit.form.ValidationTextBox",
							widgetAttrs : {
								required : true,
								regExp : "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}",
								invalidMessage : "A valid email address is required.",
								trim : true
							}
						}));
					</script>
				</div>
			</div>
			<div>
				<div class="span-6">
					<label for="mobile">Mobile Number:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:input id="mobile" path="mobile" maxlength="40" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration(
						{
							elementId : "mobile",
							widgetType : "dijit.form.ValidationTextBox",
							widgetAttrs : {
								required : true,
								regExp : "[0-9]{10,20}",
								invalidMessage : "A valid mobile number is required.",
								trim : true
							}
						}));
					</script>
				</div>
			</div>
			<div>
				<div class="span-6">
					<label for="enabled">Enabled:</label>
				</div>
				<div class="span-16 last">
					<p>
						<form:radiobutton id="enabled" path="enabled" label="Yes"
							value="true" />
						<form:radiobutton id="not-enabled" path="enabled" label="No"
							value="false" />
					</p>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ElementDecoration({
							elementId : 'enabled',
							widgetType : "dijit.form.RadioButton",
							widgetModule : "dijit.form.CheckBox",
							widgetAttrs : {
								value : "true"
							}
						}));
						Spring.addDecoration(new Spring.ElementDecoration({
							elementId : 'not-enabled',
							widgetType : "dijit.form.RadioButton",
							widgetModule : "dijit.form.CheckBox",
							widgetAttrs : {
								value : "false"
							}
						}));
					</script>
				</div>
			</div>
			<div class="span-24 last">
				<button type="submit" class="button positive" id="save" name="save">
					<img src="<c:url value="/resources/images/update.png"/>" alt=""/> Save
				</button>
				<script type="text/javascript">
					Spring.addDecoration(new Spring.ValidateAllDecoration({
						elementId : 'save',
						event : 'onclick'
					}));
				</script>
				<a class="button" href="<c:url value="/users/" />">
					<img src="<c:url value="/resources/images/list.png"/>" alt=""/> Back to List
				</a>
			</div>
		</form:form>
	</div>

</security:authorize>

<security:authorize ifNotGranted="ROLE_ADMIN">
	<p class="error">You are not authorized to access this page.</p>
</security:authorize>

<script type="text/javascript">
<!--
dojo.style("errors", "opacity", "0");
var fadeArgs = {
	node: "errors",
    duration: 500,
};
dojo.fadeIn(fadeArgs).play();
//-->
</script>