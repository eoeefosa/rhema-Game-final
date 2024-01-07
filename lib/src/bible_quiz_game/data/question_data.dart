const questionsData = [
  {
    "id": 1,
    "question": "What was the first thing God made?",
    "options": ["Man", "Birds", "Light", "Seas"],
    "answer": "Light",
    "BR": "Genesis 1:3",
    "level": 1
  },
  {
    "id": 2,
    "question":
        "God created a firmament to separate the waters from the ______.",
    "options": ["Land", "Seas", "Birds", "Waters"],
    "answer": "Waters",
    "BR": "Genesis 1:6",
    "level": 1
  },
  {
    "id": 3,
    "question": "On what day of creation did God create the sun and moon?",
    "options": ["First day", "Second day", "Fourth day", "Sixth day"],
    "answer": "Fourth day",
    "BR": "Genesis 1:14-18",
    "level": 1
  },
  {
    "id": 4,
    "question": "God called forth the birds of the air from the ______.",
    "options": ["Waters", "Ground", "Sky", "Trees"],
    "answer": "Waters",
    "BR": "Genesis 1:20",
    "level": 1
  },
  {
    "id": 13,
    "question": "Who gave Eve her name?",
    "options": ["God", "Adam", "Cain", "Abel"],
    "answer": "Adam",
    "BR": "Genesis 3:20",
    "level": 2
  },
  {
    "id": 14,
    "question":
        "God sent man out of the garden to make sure he does not eat of the tree of _______",
    "options": ["Evil", "Love", "Good", "Life"],
    "answer": "Life",
    "BR": "Genesis 1:22-23",
    "level": 2
  },
  {
    "id": 15,
    "question":
        "After God sent man out of the garden, God placed ______ at the east of the garden",
    "options": [
      "Sword of fire",
      "Pillar of fire",
      "Pillar of cloud",
      "Pillar of salt"
    ],
    "answer": "Sword of fire",
    "BR": "Genesis 3:24",
    "level": 2
  },
  {
    "id": 16,
    "question": "Which of the children of Adam was a shepherd?",
    "options": ["Cain", "Abel", "Enosh", "Jared"],
    "answer": "Abel",
    "BR": "Genesis 4:2",
    "level": 2
  },
  {
    "id": 17,
    "question":
        "After God cursed Cain, he put a mark on him so that anyone who sees him will not ______ him.",
    "options": ["Love", "Forgive", "Hate", "Kill"],
    "answer": "Kill",
    "BR": "Genesis 4:15",
    "level": 3
  },
  {
    "id": 18,
    "question": "What was the name of the first son of Cain?",
    "options": ["Lamech", "Pharez", "Zara", "Enoch"],
    "answer": "Enoch",
    "BR": "Genesis 4:17",
    "level": 3
  },
  {
    "id": 19,
    "question": "Cain built a city and named it after _______",
    "options": ["Himself", "His father", "His son", "His wife"],
    "answer": "His son",
    "BR": "Genesis 4:17",
    "level": 3
  },
  {
    "id": 20,
    "question": "Who was the first person in the Bible to marry two wives?",
    "options": ["Cain", "Lamech", "Noah", "Jacob"],
    "answer": "Lamech",
    "BR": "Genesis 4:19",
    "level": 3
  },
  {
    "id": 21,
    "question": "Who was the first musician in the Bible?",
    "options": ["Jabal", "Jubal", "Lamech", "Noah"],
    "answer": "Jubal",
    "BR": "Genesis 4:21",
    "level": 4
  },
  {
    "id": 22,
    "question": "Who was the third son of Adam and Eve?",
    "options": ["Shemei", "Enosh", "Moses", "Seth"],
    "answer": "Seth",
    "BR": "Genesis 4:25",
    "level": 4
  },
  {
    "id": 23,
    "question": "How old was Adam when his third son, Seth was born?",
    "options": ["100 years", "130 years", "200 years", "150 years"],
    "answer": "130 years",
    "BR": "Genesis 5:3",
    "level": 4
  },
  {
    "id": 24,
    "question": "How old was Adam when he died?",
    "options": ["120 years", "200 years", "900 years", "930 years"],
    "answer": "930 years",
    "BR": "Genesis 5:5",
    "level": 4
  },
  {
    "id": 25,
    "question": "Who was the person that lived the longest in the Bible?",
    "options": ["Methuselah", "Noah", "Jared", "Enoch"],
    "answer": "Methuselah",
    "BR": "Genesis 5:27",
    "level": 5
  },
  {
    "id": 26,
    "question": "Who was the father of Noah?",
    "options": ["Canaan", "Enoch", "Lamech", "Abel"],
    "answer": "Lamech",
    "BR": "Genesis 5:28-29",
    "level": 5
  },
  {
    "id": 27,
    "question": "How old was Noah when he had children?",
    "options": ["200 years", "150 years", "600 years", "500 years"],
    "answer": "500 years",
    "BR": "Genesis 5:32",
    "level": 5
  },
  {
    "id": 28,
    "question": "How many children did Noah have?",
    "options": ["Three", "Six", "Five", "Four"],
    "answer": "Three",
    "BR": "Genesis 5:32",
    "level": 5
  },
  {
    "id": 29,
    "question": "What kind of wood did Noah use in building the ark?",
    "options": ["Olive", "Lebanon", "Gopher", "Willow"],
    "answer": "Gopher",
    "BR": "Genesis 6:14",
    "level": 6
  },
  {
    "id": 30,
    "question": "What was the length of Noah's ark?",
    "options": ["400 cubits", "200 cubits", "300 cubits", "150 cubits"],
    "answer": "300 cubits",
    "BR": "Genesis 6:15",
    "level": 6
  },
  {
    "id": 31,
    "question": "How old was Noah when the great flood began?",
    "options": ["600 years", "200 years", "260 years", "365 years"],
    "answer": "600 years",
    "BR": "Genesis 7:6",
    "level": 6
  },
  {
    "id": 32,
    "question": "How many people entered Noah's ark?",
    "options": ["5", "70", "60", "8"],
    "answer": "8",
    "BR": "Genesis 7:7",
    "level": 6
  },
  {
    "id": 33,
    "question": "For how long did it rain during the great flood?",
    "options": ["Forty days", "Thirty days", "Twenty days", "Six days"],
    "answer": "Forty days",
    "BR": "Genesis 7:12",
    "level": 7
  },
  {
    "id": 34,
    "question":
        "How long did it take before the waters dried from the face of the earth after the great flood?",
    "options": ["150 days", "300 days", "30 days", "50 days"],
    "answer": "150 days",
    "BR": "Genesis 8:3",
    "level": 7
  },
  {
    "id": 35,
    "question": "On what mountain did Noah's ark rest after the flood?",
    "options": ["Olivet", "Moriah", "Moreh", "Ararat"],
    "answer": "Ararat",
    "BR": "Genesis 8:4",
    "level": 7
  },
  {
    "id": 36,
    "question":
        "Which bird did Noah first send out of the ark after the flood?",
    "options": ["Eagle", "Vulture", "Raven", "Dove"],
    "answer": "Raven",
    "BR": "Genesis 8:7",
    "level": 7
  },
  {
    "id": 37,
    "question": "What bird did Noah send out of the ark the second time?",
    "options": ["Dove", "Raven", "Hawk", "Owl"],
    "answer": "Dove",
    "BR": "Genesis 8:8",
    "level": 8
  },
  {
    "id": 38,
    "question":
        "The last time Noah sent a bird out of the ark, it came back with _______ in its mouth.",
    "options": ["A stone", "An olive leaf", "Water", "Oil"],
    "answer": "An olive leaf",
    "BR": "Genesis 8:11",
    "level": 8
  },
  {
    "id": 39,
    "question":
        "What was the first thing Noah built after he came out of the Ark?",
    "options": ["An altar", "A house", "A barn", "A bridge"],
    "answer": "An altar",
    "BR": "Genesis 8:20",
    "level": 8
  },
  {
    "id": 40,
    "question": "Which of the sons of Noah had a son called Canaan?",
    "options": ["Shem", "Japhet", "Schechem", "Ham"],
    "answer": "Ham",
    "BR": "Genesis 9:18",
    "level": 8
  },
  {
    "id": 41,
    "question": "Which of the sons of Noah saw their father's nakedness?",
    "options": ["Shem", "Ham", "Japhet", "Molech"],
    "answer": "Ham",
    "BR": "Genesis 9:22",
    "level": 9
  },
  {
    "id": 42,
    "question": "How old was Noah when he died?",
    "options": ["800 years", "900 years", "930 years", "950 years"],
    "answer": "950 years",
    "BR": "Genesis 9:29",
    "level": 9
  },
  {
    "id": 43,
    "question": "In Genesis 10, who was called a mighty hunter?",
    "options": ["Cush", "Nimrod", "Tyre", "Cain"],
    "answer": "Nimrod",
    "BR": "Genesis 10:9",
    "level": 9
  },
  {
    "id": 44,
    "question": "The city of Nineveh was built by a man called _______",
    "options": ["Jonah", "Shem", "Japhet", "Asshur"],
    "answer": "Asshur",
    "BR": "Genesis 10:11",
    "level": 9
  },
  {
    "id": 45,
    "question": "Who was the first king of the city of Babel?",
    "options": ["Nimrod", "Cush", "Ishmael", "Cain"],
    "answer": "Nimrod",
    "BR": "Genesis 10:10",
    "level": 10
  },
  {
    "id": 46,
    "question": "The tower of Babel was built in the land of ________",
    "options": ["Nineveh", "Shinar", "Moreh", "Israel"],
    "answer": "Shinar",
    "BR": "Genesis 11:2",
    "level": 10
  },
  {
    "id": 47,
    "question": "Who was the father of Abraham?",
    "options": ["Terah", "Nahor", "Haran", "Ishmael"],
    "answer": "Terah",
    "BR": "Genesis 11:26",
    "level": 10
  },
  {
    "id": 48,
    "question": "How many brothers did Abraham have?",
    "options": ["Three", "Two", "Four", "Five"],
    "answer": "Two",
    "BR": "Genesis 11:27",
    "level": 10
  },
  {
    "id": 49,
    "question": "Who was the father of Lot?",
    "options": ["Abram", "Terah", "Nahor", "Haran"],
    "answer": "Haran",
    "BR": "Genesis 11:27",
    "level": 11
  },
  {
    "id": 50,
    "question": "How old was Terah when he died?",
    "options": ["300 years", "400 years", "205 years", "250 years"],
    "answer": "205 years",
    "BR": "Genesis 11:32",
    "level": 11
  },
  {
    "id": 51,
    "question":
        "God told Abraham that he will bless him and make his Name _______",
    "options": ["Great", "Christ", "Isaac", "Hidden"],
    "answer": "Isaac",
    "BR": "Genesis 12:2",
    "level": 11
  },
  {
    "id": 52,
    "question": "How old was Abram when he left his father’s house?",
    "options": ["70 years", "50 years", "60 years", "75 years"],
    "answer": "75 years",
    "BR": "Genesis 12:4",
    "level": 11
  },
  {
    "id": 53,
    "question":
        "When Abram departed from his father's house, he went To the land of ________",
    "options": ["Horeb", "Sinai", "Haran", "Moriah"],
    "answer": "Haran",
    "BR": "Genesis 12:4",
    "level": 12
  },
  {
    "id": 54,
    "question": "Who instructed Abram to leave his father’s house?",
    "options": ["Sarai", "God", "Abimelech", "Pharaoh"],
    "answer": "God",
    "BR": "Genesis 12:4",
    "level": 12
  },
  {
    "id": 55,
    "question":
        "When Abram left his father's house for Haran, Lot Followed him",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 12:4",
    "level": 12
  },
  {
    "id": 56,
    "question": "Where did Abraham build his first altar unto God?",
    "options": ["Babel", "Nahor", "Sichem", "Ararat"],
    "answer": "Sichem",
    "BR": "Genesis 12:7",
    "level": 12
  },
  {
    "id": 57,
    "question":
        "Which land did God promise to give unto Abraham and His children?",
    "options": ["Canaan", "Nahor", "Babylon", "Persia"],
    "answer": "Canaan",
    "BR": "Genesis 5:12-7",
    "level": 13
  },
  {
    "id": 58,
    "question":
        "As Abraham journeyed, there was a famine so he Decided to move into the land of _______",
    "options": ["Jerusalem", "Egypt", "Jericho", "Ephraim"],
    "answer": "Egypt",
    "BR": "Genesis 12:10",
    "level": 13
  },
  {
    "id": 59,
    "question": "In Egypt, Abraham told Sarai to say that she was his _______",
    "options": ["Wife", "Servant", "Mother", "Sister"],
    "answer": "Sister",
    "BR": "Genesis 12:13",
    "level": 13
  },
  {
    "id": 60,
    "question":
        "On getting to Egypt, Sarai was taken into the house of _______",
    "options": ["Pharaoh", "The priest", "Her father", "The queen"],
    "answer": "Pharaoh",
    "BR": "Genesis 12:15",
    "level": 13
  },
  {
    "id": 61,
    "question":
        "Abram asked Sarai to call herself his sister because he Did not want to be _______",
    "options": ["Killed", "Laughed at", "Enslaved", "Bribed"],
    "answer": "Killed",
    "BR": "Genesis 12:13",
    "level": 14
  },
  {
    "id": 62,
    "question":
        "After Abram came out of Egypt, he journeyed towards the _______",
    "options": ["North", "East", "West", "South"],
    "answer": "South",
    "BR": "Genesis 13:1",
    "level": 14
  },
  {
    "id": 63,
    "question":
        "When Abram and Lot separated, Abram remained in Canaan While Lot went and dwelt in ________",
    "options": ["Sodom", "Gomorrah", "Jerusalem", "Gilgal"],
    "answer": "Sodom",
    "BR": "Genesis 13:12",
    "level": 14
  },
  {
    "id": 64,
    "question": "The people of Sodom were very holy in the sight of God",
    "options": ["TRUE", "FALSE"],
    "answer": "FALSE",
    "BR": "Genesis 13:13",
    "level": 11
  },
  {
    "id": 65,
    "question":
        "God told Abram that he will make his seed like the _____ Of the earth.",
    "options": ["Size", "Wind", "Animals", "Dust"],
    "answer": "Dust",
    "BR": "Genesis 13:16",
    "level": 11
  },
  {
    "id": 66,
    "question":
        "There was a man called Chedorlaomer. He was the king of ______",
    "options": ["Judah", "Egypt", "Elam", "Jericho"],
    "answer": "Elam",
    "BR": "Genesis 14:1",
    "level": 11
  },
  {
    "id": 67,
    "question": "Who was the king of Sodom?",
    "options": ["Bera", "Abram", "Pharaoh", "Melchizedek"],
    "answer": "Bera",
    "BR": "Genesis 14:2",
    "level": 11
  },
  {
    "id": 68,
    "question": "How many of Abram's servant went with him to battle?",
    "options": ["400", "318", "314", "2000"],
    "answer": "318",
    "BR": "Genesis 14:14",
    "level": 11
  },
  {
    "id": 69,
    "question": "Abram went to war to rescue _______",
    "options": ["Lot", "Sarai", "Ishmael", "Terah"],
    "answer": "Lot",
    "BR": "Genesis 14:14",
    "level": 11
  },
  {
    "id": 70,
    "question": "Abram succeeded in rescuing Lot",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 14:16",
    "level": 11
  },
  {
    "id": 71,
    "question":
        "After the war, Abram met a man who blessed him. Who Was the man?",
    "options": ["Potiphar", "Ishmael", "Shem", "Melchizedek"],
    "answer": "Melchizedek",
    "BR": "Genesis 14:18-19",
    "level": 11
  },
  {
    "id": 72,
    "question": "Melchizedek was called the king of ______",
    "options": ["Kadesh", "Salem", "Jericho", "Heaven"],
    "answer": "Salem",
    "BR": "Genesis 14:18",
    "level": 11
  },
  {
    "id": 73,
    "question": "What did Abraham give to Melchizedek?",
    "options": ["Tithes", "Land", "Bread", "Water"],
    "answer": "Tithes",
    "BR": "Genesis 14:20",
    "level": 11
  },
  {
    "id": 74,
    "question":
        "The Bible says, Abraham believed God and it was counted To him for ________",
    "options": ["Wealth", "Wisdom", "Righteousness", "Power"],
    "answer": "Righteousness",
    "BR": "Genesis 15:6",
    "level": 11
  },
  {
    "id": 75,
    "question": "Abram slept with Sarai's maid whose name was _______",
    "options": ["Meturah", "Keturah", "Hagar", "Rachael"],
    "answer": "Hagar",
    "BR": "Genesis 16:3",
    "level": 11
  },
  {
    "id": 76,
    "question": "Hagar was from _________",
    "options": ["Canaan", "Egypt", "Sodom", "Ur"],
    "answer": "Egypt",
    "BR": "Genesis 16:1",
    "level": 11
  },
  {
    "id": 77,
    "question": "After Sarai dealt with her Hagar fled to ______",
    "options": ["Her father", "The stream", "The garden", "The wilderness"],
    "answer": "The wilderness",
    "BR": "Genesis 16:6-7",
    "level": 11
  },
  {
    "id": 78,
    "question": "Who met Hagar in the wilderness?",
    "options": ["Abram", "An angel", "Sarai", "Ishmael"],
    "answer": "An angel",
    "BR": "Genesis 16:6-7",
    "level": 11
  },
  {
    "id": 79,
    "question": "Who named Ishmael?",
    "options": ["Sarai", "Abram", "Hagar", "Keturah"],
    "answer": "Abram",
    "BR": "Genesis 16:15",
    "level": 11
  },
  {
    "id": 80,
    "question": "How old was Abram when Ishmael was born?",
    "options": ["90 years", "99 years", "85 years", "86 years"],
    "answer": "86 years",
    "BR": "Genesis 16:16",
    "level": 11
  },
  {
    "id": 81,
    "question":
        "God told Abram that his son, Ishmael will beget _______ princes",
    "options": ["Twelve", "Twenty", "Nine", "Ten"],
    "answer": "Twelve",
    "BR": "Genesis 17:20",
    "level": 11
  },
  {
    "id": 82,
    "question":
        "In Genesis 17, God appeared to Abram and said, “Walk Before me and be ______\"",
    "options": ["Perfect", "Happy", "Wise", "Powerful"],
    "answer": "Perfect",
    "BR": "Genesis 17:1",
    "level": 11
  },
  {
    "id": 83,
    "question": "God told Abram that he will make him a father of many _______",
    "options": ["Children", "Sons", "Nations", "Priests"],
    "answer": "Nations",
    "BR": "Genesis 17:5",
    "level": 11
  },
  {
    "id": 84,
    "question": "What did God establish with Abram?",
    "options": ["A covenant", "A Battle", "A temple", "The law"],
    "answer": "A covenant",
    "BR": "Genesis 17:7",
    "level": 11
  },
  {
    "id": 85,
    "question": "God changed Abram's name to _______",
    "options": ["Abraham", "Abramah", "Israel", "Ephraim"],
    "answer": "Abraham",
    "BR": "Genesis 17:5",
    "level": 11
  },
  {
    "id": 86,
    "question": "With what did God mark his covenant with Abraham?",
    "options": ["Pentecost", "Passover", "Circumcision", "Supper"],
    "answer": "Circumcision",
    "BR": "Genesis 17:10",
    "level": 12
  },
  {
    "id": 87,
    "question":
        "God told Abraham that every male child must be circumcised when he is _______ old.",
    "options": ["10 years", "10 days", "5 days", "8 days"],
    "answer": "8 days",
    "BR": "Genesis 17:12",
    "level": 12
  },
  {
    "id": 88,
    "question": "God told Abraham to circumcise his servants also.",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 17:12",
    "level": 12
  },
  {
    "id": 89,
    "question": "God changed Sarai's name to _________",
    "options": ["Sarel", "Sarah", "Hagar", "Keturah"],
    "answer": "Sarah",
    "BR": "Genesis 17:15",
    "level": 12
  },
  {
    "id": 90,
    "question":
        "What did Abraham do when God told him Sarah will have a child?",
    "options": ["He danced", "He feared", "He believed", "He laughed"],
    "answer": "He laughed",
    "BR": "Genesis 17:17",
    "level": 12
  },
  {
    "id": 91,
    "question": "Which of Abraham's sons did God establish his covenant with?",
    "options": ["Midian", "Medan", "Ishmael", "Isaac"],
    "answer": "Isaac",
    "BR": "Genesis 17:21",
    "level": 12
  },
  {
    "id": 92,
    "question": "How old was Ishmael when he was circumcised?",
    "options": ["12 years", "13 years", "15 days", "8 days"],
    "answer": "13 years",
    "BR": "Genesis 17:25",
    "level": 12
  },
  {
    "id": 93,
    "question":
        "How many angels appeared to Abraham to tell him Sarah will have a child?",
    "options": ["Three", "Seven", "Six", "Ten"],
    "answer": "Three",
    "BR": "Genesis 18:2",
    "level": 12
  },
  {
    "id": 94,
    "question":
        "When Abraham met the three angels, he told them to rest _________",
    "options": ["In his house", "In his tent", "Under a tree", "On his donkey"],
    "answer": "Under a tree",
    "BR": "Genesis 18:4",
    "level": 12
  },
  {
    "id": 95,
    "question":
        "What animal did Abraham kill and prepare for the three angels?",
    "options": ["A donkey", "A goat", "A deer", "A calf"],
    "answer": "A calf",
    "BR": "Genesis 18:8",
    "level": 12
  },
  {
    "id": 96,
    "question": "What did Sarah do when the angel said she will have a child?",
    "options": ["She rejoiced", "She laughed", "She smiled", "She worshipped"],
    "answer": "She laughed",
    "BR": "Genesis 18:12",
    "level": 12
  },
  {
    "id": 97,
    "question":
        "The two cities God destroyed with fire were Sodom and ________",
    "options": ["Kadesh", "Gomorrah", "Babel", "Jordan"],
    "answer": "Gomorrah",
    "BR": "Genesis 19",
    "level": 12
  },
  {
    "id": 98,
    "question":
        "How many angels came to rescue Lot from Sodom before the city Was destroyed?",
    "options": ["Two", "Six", "Seven", "Two"],
    "answer": "Two",
    "BR": "Genesis 19:1",
    "level": 12
  },
  {
    "id": 99,
    "question": "When the angels came to Sodom, they met Lot at the _______",
    "options": ["City gate", "Market", "Wilderness", "River"],
    "answer": "City gate",
    "BR": "Genesis 19:1",
    "level": 12
  },
  {
    "id": 100,
    "question": "How many daughters did Lot have?",
    "options": ["Three", "Two", "Six", "Seven"],
    "answer": "Two",
    "BR": "Genesis 19:8",
    "level": 12
  },
  {
    "id": 101,
    "question": "How many people escaped from Sodom with Lot?",
    "options": ["Three", "Seven", "Ten", "Two"],
    "answer": "Three",
    "BR": "Genesis 19:16",
    "level": 12
  },
  {
    "id": 102,
    "question": "How did Lot and his family get out of Sodom?",
    "options": [
      "On horses",
      "On foot",
      "Angels brought them out",
      "By a whirlwind"
    ],
    "answer": "Angels brought them out",
    "BR": "Genesis 19:16",
    "level": 12
  },
  {
    "id": 103,
    "question": "What did the angel ask Lot to not do while escaping?",
    "options": ["Laugh", "Doubt", "Stop", "Look back"],
    "answer": "Look back",
    "BR": "Genesis 19:17",
    "level": 12
  },
  {
    "id": 104,
    "question": "Where did Lot and his family go to after escaping from Sodom?",
    "options": ["Ephraim", "Mahanaim", "Zoar", "Hannoch"],
    "answer": "Zoar",
    "BR": "Genesis 19:22",
    "level": 12
  },
  {
    "id": 105,
    "question": "God destroyed Sodom and Gomorrah with fire and _______",
    "options": ["Sulphur", "Brimstone", "Water", "Rain"],
    "answer": "Brimstone",
    "BR": "Genesis 19:24",
    "level": 12
  },
  {
    "id": 106,
    "question":
        "When Lot's wife looked back towards the city, she became a Pillar of _________",
    "options": ["Fire", "Cloud", "Brimstone", "Salt"],
    "answer": "Salt",
    "BR": "Genesis 19:26",
    "level": 12
  },
  {
    "id": 107,
    "question":
        "After the destruction of Sodom and Gomorrah, Lot lived in A _______ for the rest of his life.",
    "options": ["Cave", "Desert", "Wilderness", "River"],
    "answer": "Cave",
    "BR": "Genesis 19:30",
    "level": 12
  },
  {
    "id": 108,
    "question":
        "The first daughter of Lot had a son and he was called ________",
    "options": ["Ammon", "Laban", "Edom", "Moab"],
    "answer": "Moab",
    "BR": "Genesis 19:37",
    "level": 12
  },
  {
    "id": 109,
    "question": "In what city did Abraham claim that Sarah was his sister?",
    "options": ["Moriah", "Gerar", "Jericho", "Moab"],
    "answer": "Gerar",
    "BR": "Genesis 20:2",
    "level": 12
  },
  {
    "id": 110,
    "question": "Which of these kings attempted to take Sarah as his wife?",
    "options": ["David", "Solomon", "Abimelech", "Elimelech"],
    "answer": "Abimelech",
    "BR": "Genesis 20:2",
    "level": 12
  },
  {
    "id": 111,
    "question":
        "After Abimelech took Sarah, God appeared to him and told him He was a ______ man",
    "options": ["Wise", "Brave", "Dead", "Foolish"],
    "answer": "Dead",
    "BR": "Genesis 20:3",
    "level": 12
  },
  {
    "id": 112,
    "question": "Sarah was actually Abraham's sister",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 20:12",
    "level": 12
  },
  {
    "id": 113,
    "question":
        "After the warning from God, Abimelech returned Sarah to Abraham and gave Abraham _______ pieces of silver.",
    "options": ["100", "30", "10000", "1000"],
    "answer": "1000",
    "BR": "Genesis 20:16",
    "level": 12
  },
  {
    "id": 114,
    "question":
        "Because Abimelech took Sarah, God made all the women in Abimelech's House to be _______",
    "options": ["Barren", "Blind", "Lame", "Repent"],
    "answer": "Barren",
    "BR": "Genesis 20:18",
    "level": 12
  },
  {
    "id": 115,
    "question": "How old Abraham when Isaac was born?",
    "options": ["75 years", "100 years", "70 years", "90 years"],
    "answer": "100 years",
    "BR": "Genesis 21:5",
    "level": 12
  },
  {
    "id": 116,
    "question": "How old was Isaac when he was circumcised?",
    "options": ["8 years", "8 days", "7 days", "1 year"],
    "answer": "8 days",
    "BR": "Genesis 21:4",
    "level": 12
  },
  {
    "id": 117,
    "question":
        "The Bible says, “Abraham made a great feast on the day That Isaac was ________",
    "options": ["Born", "Dedicated", "Weaned", "Circumcised"],
    "answer": "Weaned",
    "BR": "Genesis 21:8",
    "level": 12
  },
  {
    "id": 118,
    "question": "On the day Isaac was weaned, Sarah saw Ishmael _________",
    "options": ["Dancing", "Weeping", "Feasting", "Mocking"],
    "answer": "Mocking",
    "BR": "Genesis 21:9",
    "level": 12
  },
  {
    "id": 119,
    "question": "After Isaac was born, Abraham ______ Hagar and Ishmael.",
    "options": ["Praised", "Sent away", "Thanked", "Mocked"],
    "answer": "Sent away",
    "BR": "Genesis 21:14",
    "level": 12
  },
  {
    "id": 120,
    "question":
        "After being sent away from Abraham's house, Hagar wandered in the Wilderness of _______",
    "options": ["Mahanaim", "Laban", "Lebanon", "Beersheba"],
    "answer": "Beersheba",
    "BR": "Genesis 21:14",
    "level": 12
  },
  {
    "id": 121,
    "question": "What did Abraham give Hagar before sending her away?",
    "options": ["Bread and water", "Sheep", "Servants", "Silver"],
    "answer": "Bread and water",
    "BR": "Genesis 21:14",
    "level": 12
  },
  {
    "id": 122,
    "question": "Ishmael grew up to be a very skillful _______",
    "options": ["Painter", "Archer", "Farmer", "Dancer"],
    "answer": "Archer",
    "BR": "Genesis 21:20",
    "level": 12
  },
  {
    "id": 123,
    "question": "Ishmael married a woman from ________",
    "options": ["Canaan", "Egypt", "Gerar", "Goshen"],
    "answer": "Egypt",
    "BR": "Genesis 21:21",
    "level": 12
  },
  {
    "id": 124,
    "question":
        "In Genesis 22, God told Abraham to offer his _______ for a burnt offering.",
    "options": ["Wife", "Daughter", "Father", "Son"],
    "answer": "Son",
    "BR": "Genesis 22:2",
    "level": 12
  },
  {
    "id": 125,
    "question":
        "God told Abraham to offer his son on one of the mountains in the land of ________",
    "options": ["Torah", "Seir", "Moriah", "Moab"],
    "answer": "Moriah",
    "BR": "Genesis 22:2",
    "level": 12
  },
  {
    "id": 126,
    "question":
        "How many servants did Abraham take along with him when he was going to sacrifice Isaac?",
    "options": ["Twelve", "Two", "Ten", "Three"],
    "answer": "Two",
    "BR": "Genesis 22:3",
    "level": 12
  },
  {
    "id": 127,
    "question":
        "For how long did Abraham journey before finding the place to sacrifice Isaac, his son?",
    "options": ["Three days", "Ten days", "Two days", "Five days"],
    "answer": "Three days",
    "BR": "Genesis 22:4",
    "level": 12
  },
  {
    "id": 128,
    "question":
        "Eventually, Abraham sacrificed a _______ to God instead of his son.",
    "options": ["Goat", "Camel", "Bull", "Ram"],
    "answer": "Ram",
    "BR": "Genesis 22:13",
    "level": 12
  },
  {
    "id": 129,
    "question":
        "What did Abraham call the place where he sacrificed a ram instead of Isaac?",
    "options": [
      "Jehovah Nissi",
      "Jehovah Jireh",
      "Jehovah Shalom",
      "Jehovah Rapha"
    ],
    "answer": "Jehovah Jireh",
    "BR": "Genesis 22:13-14",
    "level": 12
  },
  {
    "id": 130,
    "question":
        "God told Abraham, “In multiplying, I will multiply your seed as the ________",
    "options": [
      "Canaanites",
      "Stars of Heaven",
      "Amorites",
      "Birds of the air"
    ],
    "answer": "Stars of Heaven",
    "BR": "Genesis 22:17",
    "level": 12
  },
  {
    "id": 131,
    "question": "For how long did Sarah live?",
    "options": ["130 years", "150 years", "127 years", "99 years"],
    "answer": "127 years",
    "BR": "Genesis 23:1",
    "level": 12
  },
  {
    "id": 132,
    "question": "Where did Sarah die?",
    "options": ["Hebron", "Egypt", "Jordan", "Babylon"],
    "answer": "Hebron",
    "BR": "Genesis 23:2",
    "level": 12
  },
  {
    "id": 133,
    "question": "Sarah was buried in a cave in the field of ________",
    "options": ["Mamre", "Machpelah", "Zoar", "Gilgal"],
    "answer": "Machpelah",
    "BR": "Genesis 23:19",
    "level": 12
  },
  {
    "id": 134,
    "question":
        "Abraham bought the land where he buried Sarah from a man called ________",
    "options": ["Hagith", "Hananai", "Jehoram", "Ephron"],
    "answer": "Ephron",
    "BR": "Genesis 23:16",
    "level": 12
  },
  {
    "id": 135,
    "question":
        "Abraham bought the land where he buried Sarah for ________ shekels of silver.",
    "options": ["300", "400", "450", "250"],
    "answer": "400",
    "BR": "Genesis 23:16",
    "level": 12
  },
  {
    "id": 136,
    "question": "Hebron was also called ________",
    "options": ["Kibosh", "Kirjatharba", "Sinai", "Goshen"],
    "answer": "Kirjatharba",
    "BR": "Genesis 23:2",
    "level": 12
  },
  {
    "id": 137,
    "question": "Who did Abraham send to get a wife for his son, Isaac?",
    "options": ["Sarah", "Ishmael", "A servant", "Keturah"],
    "answer": "A servant",
    "BR": "Genesis 24:10",
    "level": 12
  },
  {
    "id": 138,
    "question": "Where did Abraham's servant go to get a wife for Isaac?",
    "options": ["Mesopotamia", "Nazareth", "Horeb", "Canaan"],
    "answer": "Mesopotamia",
    "BR": "Genesis 24:10",
    "level": 12
  },
  {
    "id": 139,
    "question":
        "While going to get a wife for Isaac, Abraham's servant took along with him ________ camels.",
    "options": ["1000", "10000", "100", "10"],
    "answer": "10",
    "BR": "Genesis 24:10",
    "level": 12
  },
  {
    "id": 140,
    "question":
        "Abraham's servant said that the first lady to ________ should be the wife for Isaac.",
    "options": ["Greet him", "Pass by", "Give him food", "Give him water"],
    "answer": "Give him water",
    "BR": "Genesis 24:14",
    "level": 12
  },
  {
    "id": 141,
    "question":
        "What was the name of the lady that gave Abraham's servant water to drink?",
    "options": ["Rachael", "Rebekah", "Mary", "Keturah"],
    "answer": "Rebekah",
    "BR": "Genesis 24:15",
    "level": 12
  },
  {
    "id": 142,
    "question": "Who was the father of Rebekah?",
    "options": ["Laban", "Milkah", "Bethuel", "Simon"],
    "answer": "Bethuel",
    "BR": "Genesis 24:15",
    "level": 12
  },
  {
    "id": 143,
    "question":
        "Rebekah gave water to Abraham's servant as well as to his ________",
    "options": ["Cattle", "Camels", "Children", "Wives"],
    "answer": "Camels",
    "BR": "Genesis 24:19",
    "level": 12
  },
  {
    "id": 144,
    "question": "The first gift Abraham’s servant gave Rebekah was ________",
    "options": ["An earring", "A camel", "Land", "Silver"],
    "answer": "An earring",
    "BR": "Genesis 24:22",
    "level": 12
  },
  {
    "id": 145,
    "question": "Rebekah had a brother, his name was ________",
    "options": ["Shechem", "Bethuel", "Milcah", "Laban"],
    "answer": "Laban",
    "BR": "Genesis 24:29",
    "level": 12
  },
  {
    "id": 146,
    "question":
        "After meeting Abraham's servant, Rebekah agreed to go with him that day.",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 24:55-58",
    "level": 12
  },
  {
    "id": 147,
    "question":
        "When leaving her parents to meet Isaac, Rebekah went with her ________",
    "options": ["Father", "Nurse", "Sister", "Brother"],
    "answer": "Nurse",
    "BR": "Genesis 24:59",
    "level": 12
  },
  {
    "id": 148,
    "question":
        "Before Rebekah left, her parents blessed her saying: “May your seed possess the ________ of his enemies.",
    "options": ["Gate", "Horn", "Riches", "Possession"],
    "answer": "Gate",
    "BR": "Genesis 24:60",
    "level": 12
  },
  {
    "id": 149,
    "question":
        "The first time Isaac saw Rebekah, he was in the field ________",
    "options": ["Working", "Praying", "Meditating", "Playing"],
    "answer": "Meditating",
    "BR": "Genesis 24:63",
    "level": 12
  },
  {
    "id": 150,
    "question":
        "After the death of Sarah, Abraham married another woman. Her name was ________",
    "options": ["Hagar", "Keturah", "Asenath", "Rachael"],
    "answer": "Keturah",
    "BR": "Genesis 25:1",
    "level": 12
  },
  {
    "id": 151,
    "question": "How many children did Keturah bear for Abraham?",
    "options": ["Ten", "Three", "Six", "Two"],
    "answer": "Six",
    "BR": "Genesis 25:1-2",
    "level": 12
  },
  {
    "id": 152,
    "question": "Which of these was not one of the sons of Abraham?",
    "options": ["Zimran", "Medan", "Midian", "Ithamar"],
    "answer": "Ithamar",
    "BR": "Genesis 25:1-2",
    "level": 12
  },
  {
    "id": 153,
    "question":
        "Before his death, Abraham shared his wealth amongst his children equally.",
    "options": ["TRUE", "FALSE"],
    "answer": "FALSE",
    "BR": "Genesis 25:5-6",
    "level": 12
  },
  {
    "id": 154,
    "question": "At what age did Abraham die?",
    "options": ["160 years", "120 years", "175 years", "170 years"],
    "answer": "175 years",
    "BR": "Genesis 25:7",
    "level": 12
  },
  {
    "id": 155,
    "question": "Who buried Abraham?",
    "options": ["Ishmael and Isaac", "Isaac", "Ishmael", "Keturah"],
    "answer": "Ishmael and Isaac",
    "BR": "Genesis 25:9",
    "level": 12
  },
  {
    "id": 156,
    "question": "Abraham was buried in the same place Sarah was buried.",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 25:9-10",
    "level": 12
  },
  {
    "id": 157,
    "question": "Ishmael, Abraham's son, died at the age of ________",
    "options": ["100", "400", "137", "157"],
    "answer": "137",
    "BR": "Genesis 25:17",
    "level": 12
  },
  {
    "id": 158,
    "question": "How old was Isaac when he married Rebekah?",
    "options": ["50 years", "40 years", "35 years", "45 years"],
    "answer": "40 years",
    "BR": "Genesis 25:20",
    "level": 12
  },
  {
    "id": 159,
    "question":
        "Rebekah gave birth to a set of twins. They were: Jacob and ________",
    "options": ["Esau", "Pharez", "Zara", "Simon"],
    "answer": "Esau",
    "BR": "Genesis 25:25-26",
    "level": 12
  },
  {
    "id": 160,
    "question":
        "Concerning the twins in her womb, God told Rebekah, “The elder shall serve ________",
    "options": ["The Lord", "The parents", "The devil", "The younger"],
    "answer": "The younger",
    "BR": "Genesis 25:23",
    "level": 12
  },
  {
    "id": 161,
    "question": "When Esau was born, he looked red and ______",
    "options": ["Handsome", "Hairy", "Big", "Blue"],
    "answer": "Hairy",
    "BR": "Genesis 25:25",
    "level": 12
  },
  {
    "id": 162,
    "question": "As Jacob was being born, he held unto Esau's ______",
    "options": ["Hair", "Neck", "Elbow", "Heel"],
    "answer": "Heel",
    "BR": "Genesis 25:26",
    "level": 12
  },
  {
    "id": 163,
    "question":
        "For how long were Isaac and Rebekah married before they had children?",
    "options": ["20 years", "9 months", "10 years", "15 years"],
    "answer": "20 years",
    "BR": "Genesis 25:26",
    "level": 12
  },
  {
    "id": 164,
    "question": "Esau was a ______",
    "options": ["Farmer", "Hunter", "Player", "Shepherd"],
    "answer": "Hunter",
    "BR": "Genesis 25:27",
    "level": 12
  },
  {
    "id": 165,
    "question": "Which of his sons did Isaac love the most?",
    "options": ["Esau", "Jacob"],
    "answer": "Esau",
    "BR": "Genesis 25:28",
    "level": 12
  },
  {
    "id": 166,
    "question": "Esau sold his birthright to Jacob for bread and _______",
    "options": ["Wine", "Water", "Honey", "Pottage"],
    "answer": "Pottage",
    "BR": "Genesis 25:30",
    "level": 12
  },
  {
    "id": 167,
    "question": "The Bible says, Isaac was so great that the_____ envied him.",
    "options": ["Egyptians", "Philistines", "Ishmaelites", "Midianites"],
    "answer": "Philistines",
    "BR": "Genesis 26:14",
    "level": 12
  },
  {
    "id": 168,
    "question": "Rehoboth was the name of a ______",
    "options": ["Valley", "Mountain", "Well", "City"],
    "answer": "Well",
    "BR": "Genesis 26:22",
    "level": 12
  },
  {
    "id": 169,
    "question": "Who was the wife of Esau?",
    "options": ["Judith", "Jubaal", "Asemah", "Anioleth"],
    "answer": "Judith",
    "BR": "Genesis 26:34",
    "level": 12
  },
  {
    "id": 170,
    "question":
        "Isaac asked ______ to prepare him a meal that he may eat and bless him",
    "options": ["Jacob", "Esau"],
    "answer": "Esau",
    "BR": "Genesis 27:1-4",
    "level": 12
  },
  {
    "id": 171,
    "question":
        "Before Esau came from hunting, Jacob gave Isaac a meal prepared by _____",
    "options": ["Rebekah", "Jacob", "Himself", "Isaac"],
    "answer": "Rebekah",
    "BR": "Genesis 27",
    "level": 12
  },
  {
    "id": 172,
    "question": "When presenting the meal to Isaac, Jacob wore Esau's clothes",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 27:15",
    "level": 12
  },
  {
    "id": 173,
    "question":
        "To make himself look hairy like Esau, Jacob put ______ on his neck and hands.",
    "options": ["Camel skin", "Horse skin", "Goat skin", "Sheep skin"],
    "answer": "Goat skin",
    "BR": "Genesis 27:16",
    "level": 12
  },
  {
    "id": 174,
    "question":
        "Isaac blessed Jacob saying: “May God give you of the ______ of heaven",
    "options": ["Favour", "Angels", "Blessings", "Dew"],
    "answer": "Dew",
    "BR": "Genesis 27:28",
    "level": 12
  },
  {
    "id": 175,
    "question":
        "When Esau realized Jacob had stolen his blessing, he decided he would _____ him.",
    "options": ["Forgive", "Beat", "Kill", "Fight"],
    "answer": "Kill",
    "BR": "Genesis 27:41",
    "level": 12
  },
  {
    "id": 176,
    "question": "Isaac told Esau, “By _____ shall thou live\".",
    "options": ["Faith", "The sword", "Fear", "Thy labour"],
    "answer": "The sword",
    "BR": "Genesis 27:40",
    "level": 12
  },
  {
    "id": 177,
    "question":
        "When Jacob realized Esau was going to kill him, he fled to ______",
    "options": ["Namath", "Horeb", "Haran", "Shiloh"],
    "answer": "Haran",
    "BR": "Genesis 27:43",
    "level": 12
  },
  {
    "id": 178,
    "question": "Jacob fled to Laban to meet ______",
    "options": ["His friend", "His uncle", "His cousin", "No one"],
    "answer": "His uncle",
    "BR": "Genesis 27:43",
    "level": 12
  },
  {
    "id": 179,
    "question":
        "Before Jacob fled to Haran, Isaac instructed him to not marry from _____",
    "options": ["Canaan", "Haran", "Mesopotamia", "Bethel"],
    "answer": "Canaan",
    "BR": "Genesis 28:1",
    "level": 12
  },
  {
    "id": 180,
    "question":
        "What did Jacob call the place where he had a vision of a ladder reaching heaven?",
    "options": ["Bethel", "Peniel", "Beersheba", "Dan"],
    "answer": "Bethel",
    "BR": "Genesis 28:19",
    "level": 12
  },
  {
    "id": 181,
    "question":
        "In his vision, Jacob saw _____ ascending and descending a ladder",
    "options": ["Men", "Beasts", "Angels", "Clouds"],
    "answer": "Angels",
    "BR": "Genesis 28:12",
    "level": 12
  },
  {
    "id": 182,
    "question":
        "On getting to Haran, which of the members of Laban's house did Jacob meet first?",
    "options": ["Leah", "Laban", "Bilhah", "Rachael"],
    "answer": "Rachael",
    "BR": "Genesis 29:10",
    "level": 12
  },
  {
    "id": 183,
    "question": "The first place Jacob met Rachael was by a ______",
    "options": ["River", "Slaughter", "Well", "Garden"],
    "answer": "Well",
    "BR": "Genesis 29:10-11",
    "level": 12
  },
  {
    "id": 184,
    "question": "When Jacob met Rachael he kissed her and then ____",
    "options": ["Wept", "Laughed", "Danced", "Worshipped"],
    "answer": "Wept",
    "BR": "Genesis 29:11",
    "level": 12
  },
  {
    "id": 185,
    "question": "When Jacob got to Laban's house, Laban warmly welcomed him.",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 29:13",
    "level": 12
  },
  {
    "id": 186,
    "question": "Laban had only two daughters",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 29:16",
    "level": 12
  },
  {
    "id": 187,
    "question": "The firstborn daughter of Laban was _____",
    "options": ["Leah", "Rachael", "Zilpah", "Bilhah"],
    "answer": "Leah",
    "BR": "Genesis 29:16",
    "level": 12
  },
  {
    "id": 188,
    "question": "Which of the daughters of Laban was tender-eyed?",
    "options": ["Leah", "Rachael"],
    "answer": "Leah",
    "BR": "Genesis 29:17",
    "level": 12
  },
  {
    "id": 189,
    "question":
        "Jacob agreed to serve Laban for _____ years so as to get Rachael as a wife.",
    "options": ["Twelve", "Seven", "Three", "Six"],
    "answer": "Seven",
    "BR": "Genesis 29:18",
    "level": 12
  },
  {
    "id": 190,
    "question":
        "After serving for seven years, Laban gave _____ to Jacob as a wife",
    "options": ["Leah", "Bilhah", "Zilpah", "Rachael"],
    "answer": "Rachael",
    "BR": "Genesis 29:23",
    "level": 12
  },
  {
    "id": 191,
    "question": "Who was Leah's handmaid?",
    "options": ["Bilhah", "Zilpah", "Deborah", "Dinah"],
    "answer": "Bilhah",
    "BR": "Genesis 29:24",
    "level": 12
  },
  {
    "id": 192,
    "question": "What was the name of the first son of Jacob",
    "options": ["Levi", "Simeon", "Reuben", "Judah"],
    "answer": "Reuben",
    "BR": "Genesis 29:32",
    "level": 12
  },
  {
    "id": 193,
    "question":
        "When _____ was born, Leah said, “Now will I praise the Lord\".",
    "options": ["Issachar", "Levi", "Judah", "Reuben"],
    "answer": "Judah",
    "BR": "Genesis 29:35",
    "level": 12
  },
  {
    "id": 194,
    "question": "How many children did Rachael's maid, Bilhah bear for Jacob?",
    "options": ["Three", "Ten", "Four", "Two"],
    "answer": "Two",
    "BR": "Genesis 30:5-8",
    "level": 12
  },
  {
    "id": 195,
    "question": "How many children did Leah bear for Jacob?",
    "options": ["Six", "Four", "Ten", "Seven"],
    "answer": "Seven",
    "BR": "Genesis 30:20-21",
    "level": 12
  },
  {
    "id": 196,
    "question": "Who was Joseph's mother?",
    "options": ["Rachael", "Leah", "Bilhah", "Zilpah"],
    "answer": "Rachael",
    "BR": "Genesis 30:20-21",
    "level": 12
  },
  {
    "id": 197,
    "question": "What was the name of Jacob's only daughter?",
    "options": ["Diana", "Dinah", "Asshur", "Salome"],
    "answer": "Dinah",
    "BR": "Genesis 30:21",
    "level": 12
  },
  {
    "id": 198,
    "question":
        "After the birth of _____, Jacob decided to leave Laban and return to Canaan",
    "options": ["Joseph", "Benjamin", "Dinah", "Asher"],
    "answer": "Joseph",
    "BR": "Genesis 30:25-26",
    "level": 12
  },
  {
    "id": 199,
    "question":
        "Before leaving Haran and returning home, Jacob got permission from Laban",
    "options": ["TRUE", "FALSE"],
    "answer": "TRUE",
    "BR": "Genesis 31:20",
    "level": 12
  },
  {
    "id": 200,
    "question": "Laban became aware that Jacob had left, _____ days after.",
    "options": ["Ten", "Six", "Four", "Three"],
    "answer": "Three",
    "BR": "Genesis 31:22",
    "level": 12
  },
  {
    "id": 201,
    "question": "On hearing that Jacob had fled, Laban decided to ______ him",
    "options": ["Curse", "Kill", "Pursue", "Leave"],
    "answer": "Pursue",
    "BR": "Genesis 31:23",
    "level": 12
  },
  {
    "id": 202,
    "question": "For how long did Laban pursue Jacob before he met him?",
    "options": ["Six days", "Three days", "2 days", "One night"],
    "answer": "Three days",
    "BR": "Genesis 31:23",
    "level": 12
  },
  {
    "id": 203,
    "question": "While leaving Haran, _____ stole the idols of Laban.",
    "options": ["Jacob", "Leah", "Rachael", "Reuben"],
    "answer": "Rachael",
    "BR": "Genesis 31:32",
    "level": 12
  },
  {
    "id": 204,
    "question": "Altogether, Jacob served Laban for ____ years",
    "options": ["Seven", "Fourteen", "Twelve", "Twenty"],
    "answer": "Twenty",
    "BR": "Genesis 31:41",
    "level": 12
  },
  {
    "id": 205,
    "question":
        "While returning to Canaan Jacob met some angels at a place. He then called the place ______",
    "options": ["Mahanaim", "Hebron", "Horeb", "Galeed"],
    "answer": "Mahanaim",
    "BR": "Genesis 32:1-2",
    "level": 12
  },
  {
    "id": 206,
    "question": "While returning to Canaan, Jacob met _____ on the way.",
    "options": ["Esau", "Rachael", "Isaac", "Rebekah"],
    "answer": "Esau",
    "BR": "Genesis 32",
    "level": 12
  },
  {
    "id": 207,
    "question": "When Esau came to meet Jacob, he came with _____ men",
    "options": ["300", "600", "200", "400"],
    "answer": "400",
    "BR": "Genesis 32:6",
    "level": 12
  },
  {
    "id": 208,
    "question": "When Jacob met Esau, he gave him a gift of _____",
    "options": ["Animals", "Gold", "Silver", "Servants"],
    "answer": "Animals",
    "BR": "Genesis 32:14-15",
    "level": 12
  },
  {
    "id": 209,
    "question":
        "What did Jacob call the place where he wrestled with an angel till daybreak?",
    "options": ["Bethel", "Peniel", "Kadesh", "Gilead"],
    "answer": "Peniel",
    "BR": "Genesis 32:30",
    "level": 12
  },
  {
    "id": 210,
    "question":
        "Jacob said unto the angel: “I will not let you go unless you _____ me\".",
    "options": ["Help", "Follow", "Bless", "Remember"],
    "answer": "Bless",
    "BR": "Genesis 32:26",
    "level": 12
  },
  {
    "id": 211,
    "question": "The angel changed Jacob's name to _____",
    "options": ["Ruach", "Zion", "Ephraim", "Israel"],
    "answer": "Israel",
    "BR": "Genesis 32:28",
    "level": 12
  },
  {
    "id": 212,
    "question":
        "When Jacob met Esau on his way to Canaan, he _____ seven times",
    "options": ["Kissed him", "Hugged him", "Bowed down", "Shouted"],
    "answer": "Bowed down",
    "BR": "Genesis 33:3",
    "level": 12
  },
  {
    "id": 213,
    "question":
        "The first altar Jacob built after returning from Haran was called ______",
    "options": ["EleloheIsrael", "Shammah", "El-Gibbor", "El-Shaddai"],
    "answer": "EleloheIsrael",
    "BR": "Genesis 33:20",
    "level": 12
  },
  {
    "id": 214,
    "question":
        "Which of the wives of Jacob gave birth to Leah, Jacob’s only daughter?",
    "options": ["Rachael", "Leah", "Bilhah", "Zilpah"],
    "answer": "Leah",
    "BR": "Genesis 34:1",
    "level": 12
  },
  {
    "id": 215,
    "question":
        "Who was the young man that defiled Dinah, the daughter of Jacob?",
    "options": ["Lemuel", "Hamor", "Shechem", "Shem"],
    "answer": "Shechem",
    "BR": "Genesis 34:2",
    "level": 12
  },
  {
    "id": 216,
    "question": "Shechem was the _____ of his country",
    "options": ["Prince", "King", "Priest", "Captain"],
    "answer": "Prince",
    "BR": "Genesis 34:2",
    "level": 12
  }
];
