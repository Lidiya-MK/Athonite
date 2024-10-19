import '../models/category.dart';

List<Category> sampleCategories = [
  Category(
    id: 1,
    storyIdList: [1, 3],
    image: "assets/categorySample/counsel.png",
    name: "Miracles",
    description: "Stories that capture miraculous events believed to be acts of divine intervention, showcasing faith in extraordinary circumstances.",
  ),
  Category(
    id: 2,
    storyIdList: [2, 5],
    image: "assets/categorySample/bio.png",
    name: "Journeys",
    description: "Tales of spiritual or physical journeys taken by individuals in search of truth, enlightenment, or divine inspiration.",
  ),
  Category(
    id: 3,
    storyIdList: [4],
    image: "assets/categorySample/counsel.png",
    name: "Conversions",
    description: "Accounts of personal transformations and conversions to faith, highlighting the pivotal moments that changed individuals' beliefs.",
  ),
  Category(
    id: 4,
    storyIdList: [],
    image: "assets/categorySample/bio.png",
    name: "Teachings",
    description: "Collections of teachings from saints, religious figures, or spiritual leaders, offering wisdom and guidance on various aspects of life.",
  ),
  Category(
    id: 5,
    storyIdList: [],
    image: "assets/categorySample/counsel.png",
    name: "Leadership",
    description: "Inspiring stories of leadership and service, detailing the actions and decisions of individuals who guided others in times of need.",
  ),
];
