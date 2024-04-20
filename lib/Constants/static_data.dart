
import 'package:talent_bridge/Models/candidate.dart';
import 'package:talent_bridge/Models/jobs.dart';
import 'package:talent_bridge/Models/posts.dart';

final candidates = [
  Candidate(
    name: "John Smith",
    image: 'assets/images/can1.jpg',
    description:
    "John has a robust background in project management with over a decade of experience in the tech industry. He excels at leading diverse teams and driving project milestones. John's approach integrates efficient workflows with a focus on achieving long-term strategic goals.",
    id: '1',
    isConnected: true,
    position: 'Senior Project Manager',
    experience: '10 years',
  ),

  Candidate(
    name: "Michael Brown",
    image: 'assets/images/can2.jpg',
    description:
    "Michael is an experienced software developer known for his deep expertise in mobile technologies and cloud computing. His innovative mindset and commitment to quality have led to significant improvements in product development and customer satisfaction.",
    id: '2',
    position: 'Lead Software Developer',
    experience: '8 years',
  ),

  Candidate(
    name: "David Wilson",
    image: 'assets/images/can3.jpg',
    description:
    "David's expertise lies in digital marketing with a focus on social media strategies and content creation. His ability to analyze market trends and tailor campaigns has boosted brand visibility and engagement significantly for previous employers.",
    id: '3',
    position: 'Digital Marketing Specialist',
    experience: '6 years',
  ),

  Candidate(
    name: "Chris Johnson",
    image: 'assets/images/can4.jpeg',
    description:
    "Chris has a strong financial background with experience in both corporate finance and startups. He is skilled in budget management, financial analysis, and strategic investment, making him a valuable asset to any senior management team.",
    id: '4',
    position: 'Chief Financial Officer',
    experience: '12 years',
  ),

  Candidate(
    name: "Emily Roberts",
    image: 'assets/images/can5.jpg',
    description:
    "Emily is a creative director with a passion for visual storytelling and brand development. Her leadership and creative skills have led to award-winning advertising campaigns and a notable increase in company profits through innovative brand strategies.",
    id: '5',
    isConnected: true,
    position: 'Creative Director',
    experience: '7 years',
  ),

  Candidate(
    name: "Laura Adams",
    image: 'assets/images/can6.jpg',
    description:
    "Laura specializes in human resources with an emphasis on talent acquisition and employee development. Her commitment to fostering an inclusive work environment and promoting career growth has markedly improved employee satisfaction and retention rates.",
    id: '6',
    position: 'HR Manager',
    experience: '9 years',
  ),

];

final feeds = [
  Feed(
    title: "Looking for Software Internship",
    description:
    "As artificial intelligence (AI) advances, its influence across industries deepens. From healthcare to finance, AI transforms our professional landscape and daily lives. Its revolutionary capabilities redefine workflows, enhance efficiency, and pave the way for innovative solutions, shaping the future of work and society.",
    candidateId: '1',
    userName: 'John Doe',
  ),
  Feed(
    title: "Frontend Developer Position Available",
    description:
    "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sed erat non justo volutpat laoreet ut eu dolor.",
    candidateId: '2',
    userName: 'Jane Smith',
  ),
  Feed(
    title: "Remote Backend Engineer Needed",
    description:
    "Integer ullamcorper est ac purus vehicula placerat. Nam eget mi sit amet est posuere congue. Fusce condimentum nulla sed est malesuada vestibulum.",
    candidateId: '3',
    userName: 'Alice Johnson',
  ),
];

final jobs = [

  Job(
    title: "Web Designer",
    company: "Google",
    location: "New York,USA",
    type: "Part Time",
    description:
    "We are seeking a talented and creative web designer to join our team. As a web designer, you will be responsible for designing and creating visually appealing, user-friendly websites that meet our clients' needs and specifications. You will work closely with our development team to ensure seamless integration of design and functionality.",
    logo:
    'https://static.giga.de/wp-content/uploads/2018/12/Google-logo-G-icon-symbol-2021.jpg',
  ),
  Job(
    title: "Data Analyst",
    company: "Facebook",
    location: "Ontario,Canada",
    type: "Full Time",
    description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porttitor purus odio, sit amet dignissim mauris tempus suscipit.",
    logo:
    'https://st2.depositphotos.com/1144386/7770/v/450/depositphotos_77705008-stock-illustration-original-round-blue-facebook-web.jpg',
  ),
];

