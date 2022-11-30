package com.ecopic.control.frontend.order;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ecopic.entity.OrderDetail;
import com.ecopic.entity.PictureOrder;

public class SendMail {

	public static void sendMail(PictureOrder order) {
		// Recipient's email ID needs to be mentioned.

		String table = "";

		for (OrderDetail ord : order.getOrderDetails()) {
			table += "<tr>\r\n"
					+ "                  <td align=\"left\" width=\"38%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">"
					+ ord.getPicture().getTitle() + "</td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">"
					+ ord.getPicture().getPrice() + "</td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">"
					+ ord.getQuantity() + "</td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 6px 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">"
					+ ord.getSubtotal() + "$</td>\r\n" + "                </tr>";

		}

		// Sender's email ID needs to be mentioned
		String from = "lamdo.130902@gmail.com";

		// Assuming you are sending email from through gmails smtp
		String host = "smtp.gmail.com";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		// Get the Session object.// and pass username and password
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {
				// setup app password reference
				// https://support.google.com/accounts/answer/185833?hl=en
				return new PasswordAuthentication(from, "gzacxvmqhfuvqnrr");

			}

		});

		// Used to debug SMTP issues
		session.setDebug(true);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(order.getCustomer().getEmail()));

			// Set Subject: header field
			message.setSubject("Hóa đơn mua hàng");

			// Now set the actual message

			message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "  <meta charset=\"utf-8\">\r\n"
					+ "  <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\r\n"
					+ "  <title>Email Receipt</title>\r\n"
					+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
					+ "  <style type=\"text/css\">\r\n" + "  @media screen {\r\n" + "    @font-face {\r\n"
					+ "      font-family: 'Source Sans Pro';\r\n" + "      font-style: normal;\r\n"
					+ "      font-weight: 400;\r\n"
					+ "      src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');\r\n"
					+ "    }\r\n" + "\r\n" + "    @font-face {\r\n" + "      font-family: 'Source Sans Pro';\r\n"
					+ "      font-style: normal;\r\n" + "      font-weight: 700;\r\n"
					+ "      src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');\r\n"
					+ "    }\r\n" + "  }\r\n" + "  body,\r\n" + "  table,\r\n" + "  td,\r\n" + "  a {\r\n"
					+ "    -ms-text-size-adjust: 100%; /* 1 */\r\n" + "    -webkit-text-size-adjust: 100%; /* 2 */\r\n"
					+ "  }\r\n" + "  table,\r\n" + "  td {\r\n" + "    mso-table-rspace: 0pt;\r\n"
					+ "    mso-table-lspace: 0pt;\r\n" + "  }\r\n" + "  img {\r\n"
					+ "    -ms-interpolation-mode: bicubic;\r\n" + "  }\r\n" + "  a[x-apple-data-detectors] {\r\n"
					+ "    font-family: inherit !important;\r\n" + "    font-size: inherit !important;\r\n"
					+ "    font-weight: inherit !important;\r\n" + "    line-height: inherit !important;\r\n"
					+ "    color: inherit !important;\r\n" + "    text-decoration: none !important;\r\n" + "  }\r\n"
					+ "  div[style*=\"margin: 16px 0;\"] {\r\n" + "    margin: 0 !important;\r\n" + "  }\r\n"
					+ "  body {\r\n" + "    width: 100% !important;\r\n" + "    height: 100% !important;\r\n"
					+ "    padding: 0 !important;\r\n" + "    margin: 0 !important;\r\n" + "  }\r\n" + "  table {\r\n"
					+ "    border-collapse: collapse !important;\r\n" + "  }\r\n" + "  a {\r\n"
					+ "    color: #1a82e2;\r\n" + "  }\r\n" + "  img {\r\n" + "    height: auto;\r\n"
					+ "    line-height: 100%;\r\n" + "    text-decoration: none;\r\n" + "    border: 0;\r\n"
					+ "    outline: none;\r\n" + "  }\r\n" + "  </style>\r\n" + "</head>\r\n"
					+ "<body style=\"background-color: #74c99a;\">\r\n"
					+ "  <div class=\"preheader\" style=\"display: none; max-width: 0; max-height: 0; overflow: hidden; font-size: 1px; line-height: 1px; color: #fff; opacity: 0;\">\r\n"
					+ "  </div>\r\n" + "  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
					+ "    <tr>\r\n" + "      <td align=\"center\" bgcolor=\"#D2C7BA\">\r\n"
					+ "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n"
					+ "        </table>\r\n" + "      </td>\r\n" + "    </tr>\r\n" + "    <tr>\r\n"
					+ "      <td align=\"center\" bgcolor=\"#74c99a\">\r\n"
					+ "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n"
					+ "          <tr>\r\n"
					+ "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 36px 24px 0; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;\">\r\n"
					+ "              <h1 style=\"margin: 0; font-size: 32px; font-weight: 700; letter-spacing: -1px; line-height: 48px;\">Thank you for your order!</h1>\r\n"
					+ "            </td>\r\n" + "          </tr>\r\n" + "        </table>\r\n" + "      </td>\r\n"
					+ "    </tr>\r\n" + "    <tr>\r\n" + "      <td align=\"center\" bgcolor=\"#74c99a\">\r\n"
					+ "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\r\n"
					+ "          <tr>\r\n"
					+ "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n"
					+ "              <p style=\"margin: 0;\">Here is a bill of your recent order. If you have any questions or concerns about your order, please contact us: lamdo.130902@gmail.com</a>.</p>\r\n"
					+ "            </td>\r\n" + "          </tr>\r\n" + "          <tr>\r\n"
					+ "            <td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\">\r\n"
					+ "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
					+ "                <tr>\r\n"
					+ "                  <td align=\"left\" bgcolor=\"#74c99a\" width=\"38%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Title</strong></td>\r\n"
					+ "                  <td align=\"left\" bgcolor=\"#74c99a\" width=\"8%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Price</strong></td>\r\n"
					+ "                  <td align=\"left\" bgcolor=\"#74c99a\" width=\"8%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Quantity</strong></td>\r\n"
					+ "                  <td align=\"left\" bgcolor=\"#74c99a\" width=\"8%\" style=\"padding: 12px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;\"><strong>Total</strong></td>\r\n"
					+ "                </tr>" + table + "  <tr>\r\n"
					+ "                  <td align=\"left\" width=\"38%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #74c99a; border-bottom: 2px dashed #74c99a;\"><strong></strong></td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #74c99a; border-bottom: 2px dashed #74c99a;\"><strong></strong></td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #74c99a; border-bottom: 2px dashed #74c99a;\"><strong></strong></td>\r\n"
					+ "                  <td align=\"left\" width=\"8%\" style=\"padding: 12px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-top: 2px dashed #74c99a; border-bottom: 2px dashed #74c99a;\"><strong>"
					+ order.getTotal() + "$</strong></td>\r\n" + "                </tr>\r\n"
					+ "              </table>\r\n" + "            </td>\r\n" + "          </tr>\r\n"
					+ "        </table>\r\n" + "      </td>\r\n" + "    </tr>\r\n" + "  </table>\r\n" + "</body>\r\n"
					+ "</html>", "text/html;charset=UTF-8");
//            

			System.out.println("sending...");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}