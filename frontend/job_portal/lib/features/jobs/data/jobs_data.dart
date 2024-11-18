import 'package:job_portal/features/jobs/domain/entities/job.dart';
import 'package:job_portal/features/jobs/domain/entities/job_fulfillment_category.dart';

const List<Job> JobsData = [
  Job(
    role: 'Data Analytics Engineering Manager',
    city: 'Singapore',
    description:
        'Lead and inspire a team of talented engineers to build, maintain, and optimize our data infrastructure. Drive data-driven decision-making by ensuring the seamless flow of data from various sources into actionable insights.',
    company: 'Amazon',
    companyLogo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png',
    responsibilities: [
      'Recruit, hire, and mentor a high-performing team of data engineers.',
      'Foster a collaborative and innovative team culture.',
      'Provide technical guidance and support to team members.',
      'Set clear expectations and performance goals.',
      'Design, develop, and maintain robust data pipelines and data warehouses.',
      'Implement data ingestion, transformation, and loading processes.',
      'Ensure data quality, accuracy, and consistency.',
      'Optimize data pipelines for performance and scalability.',
      'Develop effective data models and schemas to support business analytics.',
      'Collaborate with data analysts and data scientists to understand their data needs.',
      'Create data marts and data cubes for specific business use cases.',
      'Establish and enforce data governance policies and standards.',
      'Implement data security and privacy measures.',
      'Monitor data usage and access controls.',
      'Collaborate with business stakeholders to understand their data requirements.',
      'Communicate effectively with technical and non-technical audiences.',
      'Present data insights in a clear and concise manner.'
    ],
    fulfillmentCategory: [JobFulfillmentCategory(type: "Full Time")],
  ),
  Job(
      role: 'Data Scientist',
      city: 'San Francisco, California, USA',
      description:
          'Develop and apply advanced statistical techniques, machine learning algorithms, and data mining methods to solve complex business problems.',
      company: 'Meta',
      companyLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Meta_Platforms_Inc._logo.svg/1200px-Meta_Platforms_Inc._logo.svg.png',
      responsibilities: [
        'Extract, clean, and transform large datasets.',
        'Develop and deploy machine learning models.',
        'Collaborate with cross-functional teams to identify opportunities for data-driven solutions.',
        'Communicate complex technical concepts to non-technical audiences.',
      ],
      fulfillmentCategory: [
        JobFulfillmentCategory(type: "Full Time")
      ]),
  Job(
      role: 'Product Designer',
      city: 'New York, New York, USA',
      description: 'Create innovative and user-centered product designs.',
      company: 'Google',
      companyLogo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Google_logo_%282015%29.svg/1200px-Google_logo_%282015%29.svg.png',
      responsibilities: [
        'Conduct user research and usability testing.',
        'Develop wireframes, mockups, and prototypes.',
        'Collaborate with engineers and product managers to bring products to life.',
        'Iterate on designs based on user feedback and data analysis.',
      ],
      fulfillmentCategory: [
        JobFulfillmentCategory(type: "Full Time")
      ]),
  Job(
    role: 'Backend Engineer',
    city: 'London, England, United Kingdom',
    description: 'Build scalable and reliable backend systems.',
    company: 'Spotify',
    companyLogo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Spotify_logo.svg/1200px-Spotify_logo.svg.png',
    responsibilities: [
      'Design and implement APIs and microservices.',
      'Optimize database performance and scalability.',
      'Ensure system security and data privacy.',
      'Collaborate with frontend and mobile teams to deliver seamless user experiences.',
    ],
    fulfillmentCategory: [
      JobFulfillmentCategory(
        type: "Full Time",
      ),
    ],
  ),
  Job(
    role: 'Frontend Engineer',
    city: 'Tokyo, Japan',
    description: 'Develop user-friendly and high-performance web applications.',
    company: 'Sony',
    companyLogo:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Sony_logo.svg/1200px-Sony_logo.svg.png',
    responsibilities: [
      'Write clean, efficient, and maintainable code.',
      'Stay up-to-date with the latest frontend technologies and trends.',
      'Collaborate with designers and backend engineers to create exceptional user experiences.',
      'Optimize website performance and accessibility.',
    ],
    fulfillmentCategory: [
      JobFulfillmentCategory(
        type: "Full Time",
      ),
    ],
  )
];
