# SharePoint Online Site Templates example for a legal department or company

## Overview

This project showcases how Site Templates and Site Scripts can be utilized to establish a standardized collaboration approach in Microsoft Teams. By leveraging these tools, a hierarchical structure of folders with different types of documents is automatically created whenever a new Microsoft Teams is set up. This ensures that employees have a default structure in place, promoting consistency and streamlining work processes within the company.

## Features

- Automatic deployment of a predefined folder hierarchy within Microsoft Teams using Site Templates and Site Scripts.
- Standardized structure for organizing and managing documents.
- Default categories for streamlined content creation.

## Getting Started

To use this project, follow the steps below:

1. Clone the repository to your local machine.
2. Open the project in your preferred development environment.
3. Customize the Site Template and Site Script files according to your company's requirements.
   1. Under `config` folder you can find all site scripts.
   2. Change the `Deploy-LegalSiteTemplate.ps1` for the site template parameters.
4. Deploy the Site Scripts, `Deploy-LegalScripts.ps1`, and, then, the Site Template, `Deploy-LegalSiteTemplate.ps1`, in SharePoint Online.
5. Whenever a new Microsoft Teams is created, the predefined folder structure will be automatically deployed.

## Folder Structure

The folder structure created by the Site Template includes the following hierarchy:

- General (Channel)
  - Cases
    - Active Cases
    - Archived
  - Legal Docs
    - Agreements
    - Contracts
  - Legal Resources
    - Judicial Precedents
    - Laws and Regulations

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or improvements, please open an issue or submit a pull request.

## Meet the Author

Hey there! I'm Jaime López, the creator of this project. I'm passionate about simplifying collaboration and enhancing productivity in the digital workplace. With years of experience in SharePoint and Microsoft Teams, I've designed this solution to help teams thrive in a standardized working environment.

You can reach out to me via [LinkedIn](https://www.linkedin.com/in/jaimelopezlopez/). I'm also active on Substack, so feel free to check it out at [Intranet from the trenches](https://intranetfromthetrenches.substack.com/) to explore more of my projects and connect with me.
