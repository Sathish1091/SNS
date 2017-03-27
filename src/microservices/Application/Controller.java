package microservices.Application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
public class Controller {
	@Autowired
	ProductService productService;

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/sendSNSmail", method = RequestMethod.GET)
	public String sendSnsEmail() {
		productService.sendEmail();
		return "Hiii";
	}
}
