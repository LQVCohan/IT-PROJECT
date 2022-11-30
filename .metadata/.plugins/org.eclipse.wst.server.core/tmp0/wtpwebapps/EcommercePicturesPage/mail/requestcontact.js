// Manage core logic by this variable
var Settlement = [];
Settlement.empty = function(mixed_var)
{
	var undef, key, i, len;
	var emptyValues = [undef, null, false, 0, '', '0'];
	for (i = 0, len = emptyValues.length; i < len; i++)
	{
		if (mixed_var === emptyValues[i])
		{
			return true;
		}
	}
	if (typeof mixed_var === 'object')
	{
		for (key in mixed_var)
		{
			return false;
		}
		return true;
	}
	return false;
}
//---------------------------------
// kalkicode.com 
// These methods have not been changed by our tools.
// filter_var
// http_response_code
// htmlspecialchars
// strip_tags
// mail
//----------------------------

if (Settlement.empty(_POST['name']) || Settlement.empty(_POST['subject']) || Settlement.empty(_POST['message']) || !filter_var(_POST['email'], 274)) {
    http_response_code(500);
    exit;
}
name = strip_tags(htmlspecialchars(_POST['name']));
email = strip_tags(htmlspecialchars(_POST['email']));
m_subject = strip_tags(htmlspecialchars(_POST['subject']));
message = strip_tags(htmlspecialchars(_POST['message']));
to = "info@example.com";
// Change this email to your //
subject = "{m_subject}:  {name}";
body = "You have received a new message from your website contact form.\n\n"+"Here are the details:\n\nName: {name}\n\n\nEmail: {email}\n\nSubject: {m_subject}\n\nMessage: {message}";
header = "From: {email}";
header = "Reply-To: {email}";
if (!mail(to, subject, body, header)) {
    http_response_code(500);
}