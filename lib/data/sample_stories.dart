import '../models/story.dart';

Story _story({
  required String id,
  required String title,
  required String englishTitle,
  required String image,
  required String category,
  required String description,
  required String englishDescription,
  required String content,
  required String englishContent,
  required String lesson,
  required String englishLesson,
  String duration = '5 min',
  String ageRange = '6–12 years',
}) => Story(
  id: id,
  title: title,
  englishTitle: englishTitle,
  image: image,
  author: 'Hikimar Yara',
  duration: duration,
  category: category,
  description: description,
  englishDescription: englishDescription,
  content: content,
  englishContent: englishContent,
  lesson: lesson,
  englishLesson: englishLesson,
  ageRange: ageRange,
);

final List<Story> stories = [
  _story(
    id: '1', title: 'Zomo da Kunkuru', englishTitle: 'The Hare and the Tortoise', image: 'assets/images/rabbit.jpg', category: 'Dabbobi',
    description: 'Zomo mai saurin gudu ya koyi darasi mai girma daga Kunkuru mai haƙuri.', englishDescription: 'A fast hare learns a lasting lesson from a patient tortoise.',
    content: '''A wani gari mai cike da ciyayi, Zomo ya shahara da gudu. Duk lokacin da yara suka gan shi sai ya ce, “Babu wanda zai iya fin ni!” Kunkuru kuwa ba ya saurin tafiya, amma yana yin aikinsa a hankali ba tare da kasala ba.

Wata rana Zomo ya yi masa dariya a gaban sauran dabbobi. Kunkuru bai yi fushi ba. Ya ce, “Idan kana so, mu yi tsere daga ƙarƙashin bishiyar zuwa bakin rafi.”

An fara tsere. Zomo ya yi gudu sosai har ya yi nisa. Da ya waiwaya bai ga Kunkuru ba, sai ya ce, “Zan ɗan huta.” Ya kwanta a ƙarƙashin inuwa ya yi barci.

Kunkuru kuwa ya ci gaba. Bai damu da cewa tafiyarsa a hankali ba. Mataki bayan mataki ya kai bakin rafi. Da Zomo ya farka, ya yi gudu, amma ya ga Kunkuru ya riga ya isa.

Zomo ya sunkuyar da kansa ya ce, “Na koya cewa sauri ba ya wadatar idan babu natsuwa.”''',
    englishContent: '''In a green village, Hare was famous for running fast. Whenever the children saw him, he would boast, “Nobody can beat me!” Tortoise was slow, but he always worked patiently.

One day Hare laughed at Tortoise in front of the other animals. Tortoise did not get angry. He simply said, “If you like, let us race from this tree to the river.”

The race began. Hare ran far ahead and soon could not see Tortoise. “I have plenty of time,” he said, and fell asleep under a tree.

Tortoise kept moving, one steady step after another. He reached the river before Hare woke up.

Hare ran as fast as he could, but it was too late. He lowered his head and said, “I have learned that speed is not enough without patience.”''',
    lesson: 'Haƙuri da jajircewa sun fi gaggawa mara tsari.', englishLesson: 'Patience and steady effort can be stronger than careless speed.',
  ),
  _story(
    id: '2', title: 'Kaza Mai Raba Hatsi', englishTitle: 'The Hen Who Shared Her Grain', image: 'assets/images/saniya.jpg', category: 'Dabbobi',
    description: 'Kaza ta gano cewa rabawa da taimakon juna na sa ƙaramin gari ya bunƙasa.', englishDescription: 'A hen discovers how sharing can help an entire village thrive.',
    content: '''A lokacin girbin dawa, Kaza ta tara hatsi a ƙaramin rumbunta. Wasu tsuntsaye suka zo suna neman taimako saboda ruwan sama ya lalata musu abinci.

Da farko Kaza ta ji tsoron kada hatsinta ya ƙare. Sai ta tuna da yadda makwabciyarta ta taɓa ba ta ruwa lokacin zafi. Ta ce, “Mu raba abin da muke da shi. Idan muka yi aiki tare, za mu samu ƙari.”

Tsuntsayen suka tara sauran hatsi, suka gyara rumbunan da suka lalace, suka shuka sabbin iri bayan damina. Lokacin kaka ya zo, girbin ya fi na shekarar baya yawa.

Kaza ta fahimci cewa taimako ba ya rage mutum; wani lokaci yana buɗe ƙofa ga yalwa.''',
    englishContent: '''During the millet harvest, Hen filled her little storehouse. Some birds came asking for help because heavy rain had destroyed their food.

At first Hen worried that she would run out. Then she remembered how her neighbor had once given her water on a hot day. “Let us share what we have,” she said. “If we work together, we can make more.”

The birds collected the remaining grain, repaired their damaged stores, and planted new seeds after the rains. When harvest came, they had more food than the previous year.

Hen learned that helping others does not make you poorer; sometimes it opens the door to greater abundance.''',
    lesson: 'Raba abin kirki da haɗin kai suna ƙarfafa al’umma.', englishLesson: 'Sharing and cooperation make a community stronger.',
  ),
  _story(
    id: '3', title: 'Akuya da Gidan Ruwan Sama', englishTitle: 'The Goat and the Rain Shelter', image: 'assets/images/Hula.jpg', category: 'Dabbobi',
    description: 'Akuya ta koyi yin shiri kafin matsala ta zo.', englishDescription: 'A goat learns why preparation matters before trouble arrives.',
    content: '''Akuya ta kasance mai son yawo ba tare da tunanin gobe ba. A farkon damina, tsohuwar Akuya ta ce mata, “Ki gyara rumfar ki, ki tanadi ciyawa.”

Amma Akuya ta yi dariya. Ta ce, “Har yanzu rana na haskawa. Zan yi hakan gobe.”

Washegari iska mai ƙarfi ta zo da ruwa. Rumfar Akuya ta zube, ciyawarta ta jike. Ta gudu zuwa wurin tsohuwar Akuya, wadda ta riga ta gyara nata.

Tsohuwar Akuya ta karɓe ta, amma ta ce, “Ki tuna: shiri ba tsoro ba ne. Hikima ce.”

Bayan ruwan ya lafa, Akuya ta taimaka wajen gyara rumfar wasu dabbobi. Daga wannan rana ta daina barin komai sai gobe.''',
    englishContent: '''Goat loved wandering without thinking about tomorrow. At the beginning of the rainy season, Old Goat told her, “Repair your shelter and store some grass.”

Goat laughed. “The sun is still shining. I will do it tomorrow.”

The next day, strong wind and rain arrived. Goat’s shelter collapsed and her grass became wet. She ran to Old Goat, who had already prepared her own shelter.

Old Goat welcomed her but said, “Remember: preparation is not fear. It is wisdom.”

When the rain stopped, Goat helped repair other animals’ shelters. From that day, she stopped leaving everything until tomorrow.''',
    lesson: 'Shiri da wuri yana kare mu daga matsalolin da za su iya zuwa.', englishLesson: 'Preparing early can protect us from problems that may come.',
  ),

  _story(
    id: '4', title: 'Amanar Ƙaramar Kasuwa', englishTitle: 'The Promise at the Market', image: 'assets/images/Alheri.jpg', category: 'Addini',
    description: 'Yarinya ta koyi cewa amana da gaskiya suna da daraja fiye da kuɗin gaggawa.', englishDescription: 'A girl learns that honesty is worth more than quick money.',
    content: '''Maryam ta raka mahaifiyarta kasuwar gari. Bayan sun dawo gida, ta lura da wata jaka ƙarama a cikin kwandon kayan abinci. A ciki akwai kuɗi da takarda mai suna.

Maryam ta ce, “Za mu iya amfani da kuɗin nan.” Mahaifiyarta ta amsa, “Abin da ba namu ba, ba ya zama namu saboda mun same shi.”

Washegari suka koma kasuwa suka tambayi mai shago. Sun gano jakar ta wani tsoho ne wanda ya sayar da kayan amfanin gona. Ya yi matuƙar farin ciki saboda kuɗin na biyan maganin matarsa.

Ya yi musu addu’a, amma mahaifiyarta ta ce wa Maryam, “Mafi girman lada shi ne ki san kin yi abin da ya dace.”''',
    englishContent: '''Maryam went to the village market with her mother. After they returned home, she found a small bag in their food basket. It contained money and a paper with a name.

“We could use this money,” Maryam said. Her mother replied, “Something does not become ours simply because we found it.”

The next day they returned to the market and asked around. They found the owner: an elderly farmer who needed the money to buy medicine for his wife.

He thanked them and prayed for them. Maryam’s mother smiled and said, “The greatest reward is knowing that you did the right thing.”''',
    lesson: 'Amanar gaskiya tana da daraja fiye da dukiyar da ba taka ba.', englishLesson: 'Honesty is more valuable than wealth that does not belong to you.',
  ),
  _story(
    id: '5', title: 'Ruwa Ga Mai Kishirwa', englishTitle: 'Water for a Thirsty Traveler', image: 'assets/images/Wata.jpg', category: 'Addini',
    description: 'Labari kan rahama, kyautatawa, da ganin bukatar wani kafin ya roƙa.', englishDescription: 'A story about mercy, kindness, and noticing another person’s need.',
    content: '''A wata rana mai zafi, Yusuf yana dawowa daga makaranta. A bakin hanya ya ga wani matafiyi yana zaune a ƙarƙashin bishiya, fuskarsa ta nuna gajiya.

Yusuf yana da ƙaramin kwalban ruwa. Ya sha rabinsa, sai ya tuna da koyarwar gida cewa a taimaki mai buƙata idan ana da iko.

Ya miƙa kwalban ga mutumin. Mutumin ya sha ya ce, “Allah Ya saka maka da alheri.”

Da Yusuf ya dawo gida, ya ba mahaifinsa labarin. Mahaifinsa ya ce, “Ka tuna, ɗan ƙaramin alheri da aka yi da zuciya na iya zama babba a wajen Allah da mutane.”''',
    englishContent: '''On a hot afternoon, Yusuf was walking home from school. By the roadside he saw a tired traveler sitting under a tree.

Yusuf had a small bottle of water. He drank half, then remembered what he had been taught at home: help someone in need when you are able.

He offered the bottle to the traveler. The man drank and thanked him warmly.

When Yusuf told his father, his father said, “Remember, a small act of kindness done sincerely can become very great in the sight of God and in the hearts of people.”''',
    lesson: 'Rahama da taimakon mai buƙata kyawawan halaye ne.', englishLesson: 'Mercy and helping people in need are beautiful qualities.',
  ),
  _story(
    id: '6', title: 'Lokacin Addu’a da Aiki', englishTitle: 'Prayer and Responsibility', image: 'assets/images/Nuhu(A.S).jpg', category: 'Addini',
    description: 'Yaro ya koyi daidaita ibada, karatu, aiki da taimakon iyali.', englishDescription: 'A child learns to balance worship, study, responsibility, and family life.',
    content: '''Aminu yana son karatun addini, amma wani lokaci yana manta aikin gida. Wata rana ya ce, “Na yi karatu, don haka ba sai na taimaka ba.”

Kakansa ya zaunar da shi ya ce, “Ibada tana koyar da mu zama masu kyau. Idan ka san abin da ya dace amma ka ƙi aikata shi, ka rasa wani muhimmin darasi.”

Aminu ya tsara lokacinsa: addu’a, makaranta, karatun gida, taimakon mahaifiya, sannan wasa. A hankali ya zama mai tsari kuma ya fi samun lokacin hutawa.

Ya fahimci cewa kyakkyawar rayuwa tana buƙatar imani, ilimi da kyakkyawan aiki.''',
    englishContent: '''Aminu loved religious study, but sometimes he forgot his household responsibilities. One day he said, “I studied, so I do not need to help.”

His grandfather sat him down. “Faith teaches us to become better people,” he said. “If you know what is right but refuse to do it, you have missed an important lesson.”

Aminu made a simple routine: prayer, school, homework, helping his mother, and then play. He became more organized and even found more time to rest.

He learned that a good life needs faith, knowledge, and good action.''',
    lesson: 'Kyawawan halaye suna bayyana a aikace, ba magana kawai ba.', englishLesson: 'Good character is shown through action, not words alone.',
  ),

  _story(
    id: '7', title: 'Sarkin da Ya Saurari Yaro', englishTitle: 'The King Who Listened to a Child', image: 'assets/images/king.jpg', category: 'Sarakuna',
    description: 'Sarki ya gano cewa hikima ba ta tsaya ga manya ba.', englishDescription: 'A king discovers that wisdom can come from children too.',
    content: '''Wata masarauta ta yi fama da rashin ruwa. Masu ba sarki shawara suka kawo tsare-tsare masu tsada. Amma wani yaro mai suna Sani ya tsaya a bakin fada ya ce, “Ya mai girma sarki, zan iya faɗin ra’ayina?”

Sarki ya ce, “Faɗa, muna sauraro.”

Sani ya lura cewa tsohuwar rijiyar gari ta cika da laka. Ya ba da shawarar a haɗa matasa da manya wajen share ta, sannan a gyara magudanar ruwa da ke cike da datti.

Sarki ya gwada shawarar. Bayan kwanaki kaɗan ruwa ya sake gudana.

Sarki ya ce, “A yau na koyi cewa mai hankali shi ne wanda yake sauraron gaskiya, ko daga ina ta fito.”''',
    englishContent: '''A kingdom suffered from a water shortage. The king’s advisers suggested expensive plans. But a boy named Sani stood near the palace and asked, “Your Majesty, may I share an idea?”

“Speak,” said the king. “We are listening.”

Sani had noticed that the old community well was filled with mud. He suggested that young and old people clean it together and clear the blocked drainage channels.

The king tried the idea. Within days, water flowed again.

The king said, “Today I learned that a wise person listens to truth, no matter where it comes from.”''',
    lesson: 'Sauraron shawara mai kyau alama ce ta hikima.', englishLesson: 'Listening to good advice is a sign of wisdom.',
  ),
  _story(
    id: '8', title: 'Sarauniya da Rigar Biki', englishTitle: 'The Queen and the Festival Cloth', image: 'assets/images/king.jpg', category: 'Sarakuna',
    description: 'Sarauniya ta nuna yadda al’ada da taimakon masu sana’a za su iya tafiya tare.', englishDescription: 'A queen shows how culture and supporting local craft can go together.',
    content: '''A lokacin bikin gargajiya, sarauniyar gari ta so sabuwar riga. Masu kawo kaya daga nesa suka kawo mata kaya masu tsada.

Amma ta tambayi 'yan sana'ar garin ko za su iya ƙera mata zane mai kyau. Mata masu saƙa suka nuna mata zane-zanen gargajiya da suka koya daga kakanninsu.

Sarauniya ta zaɓi zane na gida. Ta ce, “Bikinmu ya fi daɗi idan muna ɗaukaka abin da mutanenmu suka koya mana.”

A bikin, yara suka ga yadda ake saƙa, rini da dinki. Wasu suka fara sha'awar koyon sana'ar iyayensu.''',
    englishContent: '''During a traditional festival, the queen wanted a new outfit. Traders from far away offered expensive cloth.

But she asked local craftspeople whether they could make something beautiful. The women showed her traditional patterns passed down from their elders.

The queen chose local cloth. “Our celebration is richer when we value what our people have learned,” she said.

At the festival, children watched weaving, dyeing, and sewing. Some became interested in learning the crafts of their families.''',
    lesson: 'Girmama sana’ar gida yana taimakawa wajen kiyaye al’adu.', englishLesson: 'Valuing local crafts helps preserve culture and tradition.',
  ),
  _story(
    id: '9', title: 'Sarkin da Bai Yi Gaggawar Hukunci ba', englishTitle: 'The King Who Waited Before Judging', image: 'assets/images/king.jpg', category: 'Sarakuna',
    description: 'Sarki ya koyi bincike da sauraron bangarorin biyu kafin hukunci.', englishDescription: 'A king learns to investigate and hear both sides before judging.',
    content: '''Wata rana mutane biyu suka zo gaban sarki. Kowannensu yana cewa ɗayan ya ɗauki akwati nasa.

Sarki bai yi hukunci nan take ba. Ya tambayi kowanne ya ba da labarinsa, sannan ya nemi masu shaida da suka ga abin da ya faru.

An gano cewa akwatunan sun yi kama sosai, kuma mai gidan ya ɗauki wanda ba nasa ba saboda kuskure.

Mutumin ya mayar da akwatin ya nemi gafara. Sarki ya ce, “Idan muka yi hukunci kafin mu bincika, za mu iya zaluntar marar laifi.”''',
    englishContent: '''One day two people came before the king. Each claimed the other had taken his box.

The king did not judge immediately. He listened to both stories and asked for witnesses who had seen what happened.

They discovered that the boxes looked almost identical, and one man had taken the wrong box by mistake.

He returned it and apologized. The king said, “If we judge before investigating, we may wrong an innocent person.”''',
    lesson: 'Kada a yanke hukunci cikin gaggawa; a fara bincike.', englishLesson: 'Do not judge too quickly; investigate first.',
  ),

  _story(
    id: '10', title: 'Alkawarin Aisha', englishTitle: 'Aisha Keeps Her Promise', image: 'assets/images/kindness.jpg', category: 'Tarbiyya',
    description: 'Aisha ta gano cewa cika alkawari yana gina amana tsakanin abokai.', englishDescription: 'Aisha learns that keeping promises builds trust.',
    content: '''Aisha ta yi wa ƙawarta Zainab alkawarin za ta taimaka mata da aikin makaranta bayan an dawo daga kasuwa. Da ta dawo, ta ji gajiya sosai kuma ta so ta kwanta.

Sai ta tuna da alkawarinta. Ta huta na ɗan lokaci, ta sha ruwa, sannan ta je gidan Zainab.

Sun kammala aikin tare. Zainab ta ce, “Na fi farin ciki da taimakonki saboda kin cika abin da kika ce.”

Aisha ta fahimci cewa amana tana farawa ne daga ƙananan alkawura da ake cika su.''',
    englishContent: '''Aisha promised her friend Zainab that she would help with homework after returning from the market. When she came home, she was tired and wanted to rest.

Then she remembered her promise. She rested briefly, drank some water, and went to Zainab’s house.

They finished the work together. Zainab said, “I am especially happy because you kept your word.”

Aisha learned that trust begins with small promises that we keep.''',
    lesson: 'Cika alkawari yana gina amana.', englishLesson: 'Keeping promises builds trust.',
  ),
  _story(
    id: '11', title: 'Gaisuwar Safiya', englishTitle: 'The Morning Greeting', image: 'assets/images/Alheri.jpg', category: 'Tarbiyya',
    description: 'Yaro ya koyi darajar gaisuwa, girmama manya da zumunci.', englishDescription: 'A child learns the value of greetings, respect, and community.',
    content: '''Bello ya saba fita makaranta ba tare da gaishe da makwabta ba. Wata rana kakarsa ta tambaye shi, “Me ya sa ba ka gaishe da Malam Musa ba?”

Bello ya ce, “Na yi sauri.” Kakarsa ta ce, “Gaisuwa ba ta ɗaukar lokaci mai yawa, amma tana iya buɗe zuciyar mutum.”

Washegari Bello ya gaishe da makwabta, ya tambayi lafiyarsu, sannan ya yi musu murmushi. Malam Musa ya yi farin ciki ya ba shi shawarar wani littafi mai kyau.

Bello ya gane cewa al’adar gaisuwa tana haɗa mutane kuma tana nuna mutunci.''',
    englishContent: '''Bello often walked to school without greeting his neighbors. One morning his grandmother asked, “Why did you not greet Mr. Musa?”

“I was in a hurry,” Bello replied. His grandmother said, “A greeting does not take much time, but it can open a person’s heart.”

The next day Bello greeted his neighbors, asked about their health, and smiled. Mr. Musa was pleased and recommended a good book to him.

Bello learned that the tradition of greeting brings people together and shows respect.''',
    lesson: 'Gaisuwa da girmamawa suna ƙarfafa zumunci.', englishLesson: 'Greetings and respect strengthen relationships.',
  ),
  _story(
    id: '12', title: 'Kwallon da Aka Mayar', englishTitle: 'The Ball That Was Returned', image: 'assets/images/rabbit.jpg', category: 'Tarbiyya',
    description: 'Yara biyu sun koyi cewa gaskiya ta fi nasarar wasa muhimmanci.', englishDescription: 'Two children learn that honesty matters more than winning a game.',
    content: '''A filin wasa, Usman ya harbi ƙwallo ta shiga gidan wani makwabci. Ya ga ƙwallon ta lalace kaɗan. Abokinsa ya ce, “Mu ɓoye ta mu ce ba mu san inda ta tafi ba.”

Usman ya ƙi. Ya ƙwanƙwasa ƙofar ya ce, “Mun buga ƙwallon nan ta shiga gidanku, kuma ta samu ɗan rauni. Yi haƙuri.”

Mai gidan ya yi murmushi. Ya ce, “Na yaba da gaskiyarku.” Ya ba su damar ɗaukar ƙwallon, sannan ya taimaka musu wajen gyara ta.

Yaran suka gane cewa kuskure ba abin kunya ba ne idan mutum ya amince da shi ya gyara.''',
    englishContent: '''At the playground, Usman kicked a ball into a neighbor’s compound. He noticed that the ball was slightly damaged. His friend said, “Let us hide it and pretend we do not know where it went.”

Usman refused. He knocked and said, “We kicked the ball here and it got damaged. We are sorry.”

The owner smiled. “I respect your honesty,” he said. He let them take the ball and even helped them repair it.

The children learned that making a mistake is not shameful when you admit it and make it right.''',
    lesson: 'Gaskiya da amincewa da kuskure suna nuna jarumta.', englishLesson: 'Honesty and owning mistakes show courage.',
  ),

  _story(
    id: '13', title: 'Gizo Mai Son Hira', englishTitle: 'The Spider Who Loved Talking', image: 'assets/images/Wata.jpg', category: 'Barkwanci',
    description: 'Gizo ya koyi cewa yawan magana ba ya maye gurbin sauraro.', englishDescription: 'Spider learns that talking a lot is not the same as listening.',
    content: '''Gizo yana da labari ga kowa. Da Kura ta fara magana, Gizo ya katse ta. Da Aku ya fara magana, Gizo ya sake katse shi.

Wata rana suka shirya gasar ba wanda zai yi magana na minti biyar. Gizo ya yi tunanin zai yi sauƙi.

Amma bayan minti ɗaya ya fara motsa baki, yana so ya faɗi labari. Abokansa suka yi dariya.

A ƙarshe Gizo ya ce, “Na gane. Idan nake yawan magana, ba na samun damar jin abin da wasu suke da shi.”

Daga ranar ya fara yin shiru lokaci-lokaci domin ya saurara.''',
    englishContent: '''Spider always had a story for everyone. When Guinea Fowl began speaking, Spider interrupted. When Parrot began, he interrupted again.

One day the friends made a game: nobody could speak for five minutes. Spider thought it would be easy.

After one minute he started moving his mouth because he wanted to tell a story. Everyone laughed.

Finally Spider said, “I understand now. If I talk all the time, I never get to hear what others have to say.”

From then on, he practiced being quiet sometimes so he could listen.''',
    lesson: 'Sauraro ma hikima ce.', englishLesson: 'Listening is also a form of wisdom.',
  ),
  _story(
    id: '14', title: 'Biri da Rigar Sarki', englishTitle: 'The Monkey and the King’s Cloth', image: 'assets/images/king.jpg', category: 'Barkwanci',
    description: 'Biri ya yi ƙoƙarin nuna kansa amma ya koyi darasin sanin iyaka.', englishDescription: 'A monkey tries to impress everyone and learns to know his limits.',
    content: '''Biri ya sami tsohuwar rigar ado a kusa da fada. Ya sa ta ya fara tafiya yana cewa, “Ni ne sabon sarki!”

Dabbobi suka yi dariya. Amma Biri bai daina ba. Ya zauna a kan kujera ya ba da umarni cewa a kawo masa ayaba uku.

Sai wani mai gadi ya zo ya ce, “Wannan riga ba ta mayar da kai sarki. Mutunci da alhakin shugabanci su ne ke nuna shugaba.”

Biri ya cire rigar ya yi dariya. “To, yau na koyi cewa ado ba ya ba mutum matsayi.”''',
    englishContent: '''Monkey found an old royal robe near the palace. He wore it and walked around saying, “I am the new king!”

The animals laughed, but Monkey continued. He sat on a chair and ordered three bananas.

A guard came and said, “This robe does not make you a king. Responsibility and good character are what make a leader.”

Monkey removed the robe and laughed. “Today I learned that clothing does not give a person a position.”''',
    lesson: 'Daraja tana fitowa daga hali da alhaki, ba ado kaɗai ba.', englishLesson: 'True respect comes from character and responsibility, not appearance.',
  ),
  _story(
    id: '15', title: 'Kunkuru da Hular Rawa', englishTitle: 'Tortoise and the Dancing Hat', image: 'assets/images/Hula.jpg', category: 'Barkwanci',
    description: 'Labari mai dariya da ke nuna cewa kada mu yarda da abin da ba mu fahimta ba.', englishDescription: 'A funny tale about asking questions before believing something.',
    content: '''A wani biki Kunkuru ya ga wata hula mai fuka-fuki tana yawo da iska. Sai ya ce, “Wannan hular tana tashi da kanta!”

Gizo ya ce, “Eh, sihiri ne.” Kunkuru ya kusan yarda. Sai wata yarinya ta nuna masa igiyar da aka ɗaura wa hular.

Kunkuru ya yi dariya ya ce, “Da na yi mamakin abin da ba sihiri ba ne!”

Tun daga wannan rana, kafin Kunkuru ya yarda da wani abu mai ban mamaki, yana tambaya, “Ta yaya aka yi?”''',
    englishContent: '''At a festival, Tortoise saw a feathered hat flying in the wind. “This hat can fly by itself!” he said.

Spider replied, “Yes, it is magic.” Tortoise almost believed him. Then a girl showed him the string attached to the hat.

Tortoise laughed. “I was amazed by something that was not magic at all!”

From that day, before believing something strange, Tortoise asked, “How did it happen?”''',
    lesson: 'Tambaya da bincike suna taimaka mana mu fahimci gaskiya.', englishLesson: 'Questions and investigation help us understand the truth.',
  ),

  _story(
    id: '16', title: 'Haske a Gidan Nana', englishTitle: 'The Light in Grandma’s House', image: 'assets/images/onboarding3.png', category: 'Kafin Barci',
    description: 'Labarin dare mai laushi game da ƙauna, tunani da kwanciyar hankali.', englishDescription: 'A gentle bedtime story about love, reflection, and peace.',
    content: '''Da dare, Safiya ta je gidan Nana. Wata ƙaramar fitila tana haskaka ɗakin. Safiya ta tambaya, “Nana, me ya sa kike son wannan tsohuwar fitila?”

Nana ta ce, “Tana tunatar da ni cewa ƙaramin haske ma yana da amfani idan duhu ya yi yawa.”

Nana ta ba ta labarin lokacin da ta kasance yarinya, lokacin da iyali suka zauna tare suna sauraron labaran kakanni.

Safiya ta saurara har barci ya fara ɗauke ta. Nana ta rufe mata bargo ta ce, “Ki kwanta lafiya. Gobe ma rana ce ta koyon sabon abu.”

Safiya ta yi murmushi ta rufe idanunta.''',
    englishContent: '''At night, Safiya visited Grandma. A small lamp lit the room. “Grandma, why do you love this old lamp?” she asked.

Grandma replied, “It reminds me that even a small light is useful when the darkness is great.”

Grandma told her about being a child, when families sat together and listened to stories from their elders.

Safiya listened until she became sleepy. Grandma tucked her in and said, “Sleep peacefully. Tomorrow is another day to learn something new.”

Safiya smiled and closed her eyes.''',
    lesson: 'Ƙananan abubuwan alheri suna iya kawo babban farin ciki.', englishLesson: 'Small acts of goodness can bring great comfort.',
    duration: '4 min',
  ),
  _story(
    id: '17', title: 'Tauraron da Ya Koya Wa Musa', englishTitle: 'The Star That Taught Musa', image: 'assets/images/Wata.jpg', category: 'Kafin Barci',
    description: 'Yaro ya koyi yin haƙuri da kallon kyawun halitta kafin ya yi barci.', englishDescription: 'A child learns patience and wonder by watching the night sky.',
    content: '''Musa ya kasa barci. Ya fita tsakar gida tare da mahaifinsa. Sama ta cika da taurari.

Musa ya ce, “Baba, me ya sa taurari suke ƙanana?” Mahaifinsa ya ce, “Wasu suna nesa sosai. Abin da muke gani ba koyaushe yake nuna ainihin girma ba.”

Suka zauna cikin shiru. Musa ya fara sauraron iska da ƙananan sautin dare.

Bayan ɗan lokaci ya ce, “Na ji jikina ya yi sanyi.” Mahaifinsa ya ce, “To, mu koma ciki. Lokacin hutawa ya yi.”

Musa ya kwanta yana tunanin taurari, sai barci ya zo a hankali.''',
    englishContent: '''Musa could not sleep, so he went outside with his father. The sky was full of stars.

“Dad, why do the stars look so small?” Musa asked. His father said, “Some are very far away. What we see does not always show the true size of something.”

They sat quietly. Musa listened to the wind and the gentle sounds of the night.

After a while he said, “I feel sleepy.” His father smiled. “Then let us go inside. It is time to rest.”

Musa went to bed thinking about the stars, and sleep slowly arrived.''',
    lesson: 'Natsuwa da tunani suna taimaka wa zuciya ta huta.', englishLesson: 'Quiet reflection can help the mind and heart rest.',
    duration: '4 min',
  ),
  _story(
    id: '18', title: 'Kakanmu da Tsohuwar Keke', englishTitle: 'Grandpa and the Old Bicycle', image: 'assets/images/onboarding2.png', category: 'Kafin Barci',
    description: 'Kaka ya ba jikansa labarin darajar abubuwan da ake gyarawa da kuma tunanin baya.', englishDescription: 'Grandpa shares a gentle lesson about repairing things and remembering the past.',
    content: '''Kaka yana da tsohuwar keke a bayan gida. Har yanzu yana gyara ta duk da cewa ba ya hawa ta sosai.

Jikansa Haruna ya tambaya, “Kaka, me ya sa ba ka jefar da ita ba?”

Kaka ya ce, “Wannan keken ya kai ni makaranta lokacin da nake yaro. Ta koya mini cewa idan abu ya lalace, ba koyaushe ake jefar da shi ba; wani lokaci ana gyara shi.”

Haruna ya taimaka masa goge sarkar keken. Da dare, Kaka ya ba shi labarin tafiyarsa makaranta.

Haruna ya kwanta yana tunanin tsohon keken da sabbin abubuwan da zai koya gobe.''',
    englishContent: '''Grandpa had an old bicycle behind the house. He still repaired it even though he rarely rode it.

His grandson Haruna asked, “Grandpa, why don’t you throw it away?”

Grandpa replied, “This bicycle carried me to school when I was young. It taught me that when something is damaged, we do not always throw it away; sometimes we repair it.”

Haruna helped clean the bicycle chain. That night, Grandpa told him stories of his school days.

Haruna went to bed thinking about the old bicycle and all the new things he would learn tomorrow.''',
    lesson: 'Kula da abubuwa, girmama tarihi, da koyon darasi daga manya suna da amfani.', englishLesson: 'Caring for things, respecting history, and learning from elders are valuable.',
    duration: '5 min',
  ),
];
