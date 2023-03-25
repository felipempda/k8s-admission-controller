# How to create a Kubernetes Admission Controller

Here is the official [documentation](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/) of this feature.

The admission Controller is a validation you can add to objects before they are applied to the cluster. It's kind of a **before-insert** trigger in a table if you wish. This is done right after Authentication and Authorization and allows you to apply policies that would prevent certain misconfigurations/undesired states.

There are already some in place but you can also create your own.

## Demo

I would like to create an Admission Controller that would prevent the creation of deployments with only **one** replica. This is to make sure that for every deployment in a given namespace, there would be at least two or more copies of the application. That policy would be activated in a namespace by setting a label (a very common pattern in k8s).

Here are the steps to accomplish this:
- [1. Create SSL Certificates for CA and App](docs/1.CREATE_CERTS.md)
- [2. Create a Go application with the Admission Logic](docs/2.CREATE_GO_APP.md)
- [3. Build the application as a container image](docs/3.BUILD_APP.md)
- [4. Deploy the application to Kubernetes](docs/4.DEPLOY_APP.md/)
- [5. Create a Service in Kubernetes to expose this deployment](docs/5.CREATE_SERVICE.md)
- [6. Create an Admissionregistration object that calls this Service for the right API action and Labeled Namespace](docs/6.CREATE_ADMISSION_OBJECT.md)
- [7. Test the admission controller](docs/7.TEST.md)

