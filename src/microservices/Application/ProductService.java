package microservices.Application;

import org.springframework.stereotype.Service;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

@Service
public class ProductService {
	public static void sendEmail() {

		String FROM = "SS00500794@TechMahindra.com"; // Replace with
																	// your "From"
																	// address. This
																	// address must
																	// be verified.
		String TO = "SS00500794@TechMahindra.com"; // Replace with a
																// "To" address. If
																// you have not yet
																// requested
		// production access, this address must be verified.
		String BODY = "This email was sent through Amazon SES by using the AWS SDK for Java.";
		String SUBJECT = "Amazon SES test (AWS SDK for Java)";


			Destination destination = new Destination()
					.withToAddresses(new String[] { TO });

			Content subject = new Content().withData(SUBJECT);
			Content textBody = new Content().withData(BODY);
			Body body = new Body().withText(textBody);

			// Create a message with the specified subject and body.
			Message message = new Message().withSubject(subject).withBody(body);

			// Assemble the email.
			SendEmailRequest request = new SendEmailRequest().withSource(FROM)
					.withDestination(destination).withMessage(message);

			try {
				System.out
						.println("Attempting to send an email through Amazon SES by using the AWS SDK for Java...");

				AWSCredentials credentials = null;
				try {
					credentials = new ProfileCredentialsProvider().getCredentials();
				} catch (Exception e) {
					throw new AmazonClientException(
							"Cannot load the credentials from the credential profiles file. "
									+ "Please make sure that your credentials file is at the correct "
									+ "location (~/.aws/credentials), and is in valid format.",
							e);
				}

				AmazonSimpleEmailServiceClient client = new AmazonSimpleEmailServiceClient(
						credentials);

				Region REGION = Region.getRegion(Regions.US_WEST_2);
				client.setRegion(REGION);

				client.sendEmail(request);
				System.out.println("Email sent!");

			} catch (Exception ex) {
				System.out.println("The email was not sent.");
				System.out.println("Error message: " + ex.getMessage());
			}
}
}
