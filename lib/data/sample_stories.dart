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

  _story(
    id: '19', title: 'Aisha da Lambun Makaranta', englishTitle: 'Aisha and the School Garden',
    image: 'assets/images/Alheri.jpg', category: 'Tarbiyya',
    description: 'Aisha ta nuna yadda haɗin kai da kulawa ke sa abubuwa su bunƙasa.',
    englishDescription: 'Aisha shows how teamwork and care help things grow.',
    content: '''Aisha ta lura cewa filin makarantar su babu furanni, kuma ƙasa ta bushe. Ta tambayi malaminsu ko za su iya yin ƙaramin lambu. Malami ya yarda, amma ya ce kowa zai ba da gudummawa.

Wasu yara suka kawo iri, wasu suka nemo tsofaffin bokitai, wasu kuma suka taimaka da ruwa. Aisha ta rubuta jadawalin wanda zai shayar da tsire-tsire kowace rana.

A makon farko, wasu tsire-tsire suka bushe saboda an manta da su. Aisha ba ta zargi kowa ba. Ta kira abokanta suka gyara jadawalin tare. Bayan makonni, furanni suka buɗe, malam buɗe ido suka zo, kuma makarantar ta yi kyau.

Yaran sun fahimci cewa aiki tare yana bukatar haƙuri da ɗaukar nauyi.''',
    englishContent: '''Aisha noticed that her schoolyard had no flowers and the soil was dry. She asked their teacher if they could create a small garden. He agreed, but said everyone should contribute.

Some children brought seeds, others found old buckets, and others carried water. Aisha made a schedule so the plants would be watered every day.

During the first week, a few plants dried out because someone forgot. Aisha did not blame anyone. She gathered her friends and they improved the schedule together. Weeks later, flowers bloomed, butterflies arrived, and the school looked beautiful.

The children learned that teamwork requires patience and responsibility.''',
    lesson: 'Haɗin kai, haƙuri da ɗaukar nauyi suna kawo sakamako mai kyau.',
    englishLesson: 'Teamwork, patience, and responsibility lead to good results.',
  ),
  _story(
    id: '20', title: 'Sani da Gaskiyar Da Ya Faɗa', englishTitle: 'Sani Tells the Truth',
    image: 'assets/images/Alheri.jpg', category: 'Tarbiyya',
    description: 'Sani ya gano cewa faɗin gaskiya yana buƙatar ƙarfin hali.',
    englishDescription: 'Sani discovers that telling the truth takes courage.',
    content: '''A lokacin wasa, Sani ya buga ƙwallo da ƙarfi har ta fasa tukunyar furen makwabcinsu. Abokansa suka ce masa ya gudu, domin babu wanda ya gan shi.

Sani ya ji tsoro. Ya san mahaifiyarsa za ta yi baƙin ciki, amma ya tuna cewa ta koya masa kada ya ɓoye kuskure. Ya je ya gaya wa makwabcin abin da ya faru, sannan ya nemi afuwa.

Makwabcin ya yi shiru na ɗan lokaci, sai ya ce, “Na ji daɗin gaskiyarka. Kuskure yana faruwa, amma dole mu gyara shi.” Sani ya taimaka wajen share tarkacen, kuma ya yi amfani da kuɗin aljihunsa wajen sayen sabon tukunyar fure.

Sani ya ji sauƙi a zuciyarsa. Ya gane cewa gaskiya tana iya zama da wahala a farko, amma tana gina amana.''',
    englishContent: '''While playing, Sani kicked the ball so hard that it broke their neighbour’s flowerpot. His friends told him to run away because nobody had seen him.

Sani felt afraid. He knew his mother would be disappointed, but he remembered her advice never to hide a mistake. He told the neighbour what had happened and apologised.

The neighbour was quiet for a moment, then said, “I appreciate your honesty. Mistakes happen, but we must try to make things right.” Sani helped clean up and used his pocket money to buy a new flowerpot.

Sani felt lighter inside. He learned that honesty may be difficult at first, but it builds trust.''',
    lesson: 'Gaskiya da gyara kuskure suna gina amana.',
    englishLesson: 'Honesty and making amends build trust.',
  ),
  _story(
    id: '21', title: 'Zaki da Ƙaramin Tsuntsu', englishTitle: 'The Lion and the Little Bird',
    image: 'assets/images/king.jpg', category: 'Dabbobi',
    description: 'Zaki ya koyi cewa kowa na iya taimakawa, komai ƙanƙantarsa.',
    englishDescription: 'A lion learns that everyone can help, no matter how small.',
    content: '''Wata rana Zaki ya makale da ƙaya a tafinsa. Ya yi ruri, amma sauran dabbobi suka ji tsoro suka gudu. Wani ƙaramin tsuntsu ya tsaya a kan reshe ya tambaye shi ko zai iya taimakawa.

Zaki ya yi mamaki: “Kai ƙarami ne sosai. Ta yaya za ka taimake ni?” Tsuntsun ya nuna masa yadda zai kwantar da ƙafarsa a kan dutse, sannan ya kira Biri wanda ya kawo ƙaramin sandar cire ƙayar.

Da suka cire ƙayar, Zaki ya gode musu. Daga wannan rana bai sake raina wata dabba ba. Ya fahimci cewa ƙarfin jiki ba shi ne kaɗai muhimmanci ba; hankali da taimako ma suna da daraja.''',
    englishContent: '''One day a thorn became stuck in Lion’s paw. He roared, but the other animals were frightened and ran away. A little bird stayed on a branch and asked if it could help.

Lion was surprised. “You are so small. How could you help me?” The bird showed him how to rest his paw on a rock, then called Monkey, who brought a small stick to remove the thorn.

After the thorn was removed, Lion thanked them. From that day, he never looked down on another animal. He learned that physical strength is not everything; wisdom and helpfulness matter too.''',
    lesson: 'Kada a raina kowa; kowa na da irin gudummawar da zai bayar.',
    englishLesson: 'Never look down on anyone; everyone has something to contribute.',
  ),
  _story(
    id: '22', title: 'Kunkuru Mai Kyakkyawar Shawara', englishTitle: 'Tortoise Gives Wise Advice',
    image: 'assets/images/rabbit.jpg', category: 'Dabbobi',
    description: 'Dabbobi sun koyi sauraro kafin yanke hukunci.',
    englishDescription: 'The animals learn to listen before making a decision.',
    content: '''Dabbobin daji sun sami bishiyar mangwaro mai 'ya'ya kaɗan. Zomo ya ce shi ne ya kamata ya karɓi mafi yawansu saboda shi ne ya fara ganinta. Biri ya ce shi ya kamata ya samu saboda shi ne ya hau bishiyar.

Dabbobin suka fara gardama. Kunkuru ya ce, “Ku tsaya. Mu tuna wanda ya shayar da bishiyar lokacin fari.” Sai suka gano cewa Giwa ce ta kawo ruwa, Tsuntsaye suka watsa iri, kuma sauran dabbobi sun kare ƙananan tsire-tsire.

Sai suka yanke shawarar raba mangwaron daidai, sannan su dasa wasu iri. Kowa ya samu ɗan abin ci, kuma sun shirya samun ƙarin 'ya'ya a nan gaba.

Sun fahimci cewa sauraro da adalci sun fi gardama amfani.''',
    englishContent: '''The forest animals found a mango tree with only a few fruits. Hare said he deserved most because he had seen it first. Monkey argued that he deserved the most because he could climb it.

The animals began to quarrel. Tortoise said, “Wait. Let us remember who cared for the tree during the dry season.” They realised Elephant had brought water, birds had spread seeds, and other animals had protected the young plants.

They decided to share the mangoes fairly and plant more seeds. Everyone had something to eat, and they prepared for a better harvest in the future.

They learned that listening and fairness are more useful than arguing.''',
    lesson: 'Adalci da sauraro suna taimaka wa kowa.',
    englishLesson: 'Fairness and listening help everyone.',
  ),
  _story(
    id: '23', title: 'Yarima Mai Tawali’u', englishTitle: 'The Humble Prince',
    image: 'assets/images/king.jpg', category: 'Sarakuna',
    description: 'Yarima ya koyi cewa shugabanci hidima ne, ba girman kai ba.',
    englishDescription: 'A prince learns that leadership is service, not pride.',
    content: '''Yarima Nura yana son a kira shi mai girma a ko da yaushe. Ba ya son taimaka wa ma'aikatan fada, kuma yana wucewa ba tare da gaishe da mutane ba.

Wata rana ruwan sama ya lalata gadar da ke kai wa ƙauyen abinci. Nura ya ga dattawa da matasa suna ɗaukar itace da duwatsu domin gyara hanya. Da farko ya so ya koma fada, amma sai ya ajiye rigarsa mai kyau ya taimaka.

Aiki ya yi masa wahala, amma ya ji daɗin ganin mutane sun haɗu. Bayan an gyara gadar, sarki ya ce, “Yau ka nuna abin da ya sa mutum ya zama shugaba.”

Nura ya fahimci cewa mutane suna girmama shugaba saboda ayyukansa da tausayi, ba saboda taken da yake da shi ba.''',
    englishContent: '''Prince Nura wanted everyone to call him important. He disliked helping the palace workers and often passed people without greeting them.

One day, heavy rain damaged the bridge used to bring food to a nearby village. Nura saw elders and young people carrying wood and stones to repair the path. At first he wanted to return to the palace, but he set aside his fine robe and joined them.

The work was difficult, but he felt happy seeing everyone cooperate. When the bridge was repaired, the king said, “Today you have shown what makes a true leader.”

Nura learned that people respect leaders for their actions and compassion, not their titles.''',
    lesson: 'Shugabanci na gaskiya hidima ne da tausayi.',
    englishLesson: 'True leadership means service and compassion.',
  ),
  _story(
    id: '24', title: 'Sarauniya da Rijiyar Gari', englishTitle: 'The Queen and the Village Well',
    image: 'assets/images/king.jpg', category: 'Sarakuna',
    description: 'Sarauniya ta haɗa kan al’umma domin kare ruwan da kowa ke bukata.',
    englishDescription: 'A queen unites her community to protect their shared water.',
    content: '''Sarauniya Zainab ta lura cewa rijiyar gari tana ƙara datti. Wasu suna zubar da shara kusa da ita, wasu kuma suna wanke tukwane a wurin da ruwan ke shiga.

Ta kira shugabannin unguwanni, yara da manya domin su tattauna. Maimakon ta yi fushi kawai, ta tambayi kowa yadda za su gyara matsalar. Aka tsara ranar tsaftace rijiyar, aka sanya kwandon shara, kuma aka koyar da yara yadda za su kare ruwa.

Bayan wani lokaci, wurin ya zama mai tsafta, kuma mutane suka fara kula da shi. Sarauniya ta yaba wa kowa saboda sun ɗauki matsalar a matsayin aikinsu na bai ɗaya.

Garin ya koyi cewa dukiya ta gama-gari tana bukatar kulawar kowa.''',
    englishContent: '''Queen Zainab noticed that the village well was becoming dirty. Some people threw rubbish nearby, while others washed pots where water entered the well.

She invited neighbourhood leaders, children, and elders to discuss the problem. Instead of only scolding them, she asked everyone how they could improve things. They organised a cleaning day, placed a rubbish bin nearby, and taught children how to protect water.

After some time, the area became clean and people took better care of it. The queen thanked everyone for treating the problem as a shared responsibility.

The village learned that shared resources need everyone’s care.''',
    lesson: 'Abubuwan gama-gari suna bukatar kulawa da haɗin kan kowa.',
    englishLesson: 'Shared resources need everyone’s care and cooperation.',
  ),
  _story(
    id: '25', title: 'Balarabe Mai Barkwanci', englishTitle: 'Balarabe the Funny Neighbour',
    image: 'assets/images/Alheri.jpg', category: 'Barkwanci',
    description: 'Barkwanci mai kyau yana faranta rai ba tare da cutar da wani ba.',
    englishDescription: 'Good humour brings joy without hurting anyone.',
    content: '''Balarabe ya shahara da barkwanci a unguwa. Wata rana ya ga abokinsa Musa ya zubar da lemu a rigarsa. Ya kusa yi masa dariya a gaban kowa, amma ya lura Musa ya damu.

Sai Balarabe ya kawo ruwa da kyalle ya taimaka masa tsaftace rigar. Daga baya ya ba da labarin yadda shi ma ya taɓa zubar da miya a kan takalmansa yayin liyafa. Kowa ya yi dariya, har Musa ya fara murmushi.

Balarabe ya gane cewa barkwanci ya fi daɗi idan kowa yana jin daɗi. Tun daga wannan rana, ya guji dariya da kuskuren mutane, sai dai ya nemi labarai masu faranta rai ga kowa.''',
    englishContent: '''Balarabe was famous for making people laugh. One day he saw his friend Musa spill orange drink on his shirt. He almost laughed at him in front of everyone, but noticed Musa was upset.

Balarabe brought water and a cloth to help clean the shirt. Later, he told a story about how he had once spilled soup on his own shoes at a celebration. Everyone laughed, and Musa began to smile too.

Balarabe learned that jokes are best when everyone can enjoy them. From then on, he avoided laughing at people’s mistakes and looked for stories that made everyone feel included.''',
    lesson: 'Barkwanci mai kyau ba ya wulaƙanta ko kunyata mutane.',
    englishLesson: 'Good humour does not insult or embarrass others.',
  ),
  _story(
    id: '26', title: 'Dare Mai Taurari', englishTitle: 'The Starry Night',
    image: 'assets/images/Wata.jpg', category: 'Kafin Barci',
    description: 'Labari mai laushi game da godiya, iyali da abubuwan al’ajabi na sama.',
    englishDescription: 'A gentle bedtime story about gratitude, family, and the night sky.',
    content: '''Kafin barci, Fatima ta zauna a baranda tare da kakarta. Sama ta cika da taurari, iska kuma tana kaɗa ganyen bishiya a hankali.

Fatima ta tambaya, “Kaka, me ya sa taurari suke haskakawa?” Kakarta ta ce ba ta san dukkan amsoshi ba, amma suna iya kallon sararin sama, yin tambayoyi, sannan su koya daga littattafai da malamai.

Suka ambaci abubuwa uku da suka faranta musu rai a ranar: abincin da suka ci, abokiyar da ta taimaki Fatima, da lokacin da suka yi tare. Fatima ta gode wa kakarta, ta shiga ɗaki ta shirya barci cikin kwanciyar hankali.

Ta rufe ido tana tunanin abubuwan da za ta koya gobe.''',
    englishContent: '''Before bedtime, Fatima sat on the veranda with her grandmother. The sky was full of stars, and the breeze gently moved the tree leaves.

“Grandma, why do stars shine?” Fatima asked. Her grandmother said she did not know every answer, but they could look at the sky, ask questions, and learn from books and teachers.

They each named three things that had made them happy that day: the food they had eaten, a friend who helped Fatima, and the time they had spent together. Fatima thanked her grandmother, went inside, and prepared for sleep peacefully.

She closed her eyes thinking about the things she would learn tomorrow.''',
    lesson: 'Godiya da son koyo suna kawo farin ciki da kwanciyar hankali.',
    englishLesson: 'Gratitude and curiosity bring joy and peace.',
    duration: '4 min',
  ),
  _story(
    id: '27', title: 'Ƙaramar Fitila', englishTitle: 'The Little Lantern',
    image: 'assets/images/Wata.jpg', category: 'Kafin Barci',
    description: 'Yarinya ta gano cewa ƙaramin taimako na iya haskaka duhu.',
    englishDescription: 'A child discovers that even a little help can brighten darkness.',
    content: '''A daren da wutar lantarki ta yanke, ƙaramar Zarah ta ji tsoron duhun ɗaki. Mahaifinta ya kunna fitila mai ƙaramin haske ya zauna kusa da ita.

Zarah ta lura cewa hasken fitilar bai haskaka gidan gaba ɗaya ba, amma ya isa su ga littafinsu da juna. Ta ɗauko littafin labari, mahaifinta ya karanta mata a hankali.

Bayan labarin, Zarah ta ce, “Fitilar ƙarama ce, amma ta taimaka mana.” Mahaifinta ya amsa, “Haka ma ƙaramar kyautatawa. Ba sai ka yi babban abu ba kafin ka taimaki wani.”

Zarah ta kwanta cikin kwanciyar hankali, tana tunanin yadda za ta taimaka wa abokiyarta gobe.''',
    englishContent: '''One evening, the electricity went out and little Zarah became frightened by the dark room. Her father switched on a small lantern and sat beside her.

Zarah noticed that the lantern did not light the whole house, but it gave them enough light to see each other and their book. She brought a storybook, and her father read slowly.

After the story, Zarah said, “The lantern is small, but it helped us.” Her father replied, “Small acts of kindness are like that. You do not need to do something enormous to help another person.”

Zarah fell asleep peacefully, thinking about how she could help her friend tomorrow.''',
    lesson: 'Ƙaramin alheri ma yana iya kawo babban canji.',
    englishLesson: 'Even a small act of kindness can make a difference.',
    duration: '4 min',
  ),
  _story(
    id: '28', title: 'Malam Musa da Littafin Sirri', englishTitle: 'Teacher Musa and the Secret Book',
    image: 'assets/images/Alheri.jpg', category: 'Tarbiyya',
    description: 'Yara sun gano cewa littafi yana buɗe ƙofa ga sababbin tunani.',
    englishDescription: 'Children discover that books open doors to new ideas.',
    content: '''A ɗakin karatu na makaranta akwai wani tsohon littafi mai murfi shuɗi. Yara suna kiran sa littafin sirri saboda ba su taɓa buɗe shi ba.

Wata rana Malam Musa ya buɗe littafin a gabansu. Ba sihiri ba ne a ciki; akwai labaran tsoffin birane, hotunan tsirrai, da tambayoyi masu ban sha’awa. Malamin ya raba yara ƙungiyoyi, kowace ƙungiya ta zaɓi abin da take son bincika.

Hauwa ta koyi yadda ake shuka wake, Bashir ya gano dalilin da ya sa inuwa ke canzawa, Zainab kuma ta rubuta sabon labari. Yara suka fara ziyartar ɗakin karatu kullum.

Sun fahimci cewa abin mamaki na littafi ba sihiri ba ne, ilimi ne da ke sa tunani ya faɗaɗa.''',
    englishContent: '''In the school library there was an old book with a blue cover. The children called it the secret book because they had never opened it.

One day Teacher Musa opened it in front of them. It contained no magic, but stories of old cities, pictures of plants, and fascinating questions. He divided the children into groups and let each group choose something to investigate.

Hauwa learned how to grow beans, Bashir discovered why shadows change, and Zainab wrote a new story. Soon the children began visiting the library every day.

They learned that a book’s wonder is not magic; it is knowledge that expands the mind.''',
    lesson: 'Karatu da tambayoyi suna faɗaɗa ilimi da tunani.',
    englishLesson: 'Reading and asking questions expand knowledge and imagination.',
  ),
  _story(
    id: '29', title: 'Gonar da Ta Ceto Ƙauye', englishTitle: 'The Farm That Helped a Village',
    image: 'assets/images/saniya.jpg', category: 'Tarbiyya',
    description: 'Al’umma ta haɗa kai wajen noma da raba amfanin gona.',
    englishDescription: 'A community works together to farm and share its harvest.',
    content: '''Lokacin damina ya yi rauni, kuma iyalai da dama sun damu da abinci. Malam Adamu ya ba da shawarar a yi amfani da wani fili da ba a noma ba. Ya gayyaci makwabta su yi aiki tare.

Wasu suka share ciyawa, wasu suka gyara ƙasa, wasu kuma suka tanadi iri. Yara sun taimaka da shayar da tsire-tsire da kuma kiyaye su daga dabbobi. Ba kowane abu ya yi sauƙi ba; kwari sun lalata wasu ganyaye, amma manoma suka nemi shawarar ƙwararru suka magance matsalar.

Lokacin girbi, sun tara kayan lambu da hatsi. Sun raba wa iyalai da suka fi buƙata, sannan suka ajiye iri don kakar gaba. Ƙauyen ya fahimci cewa ilimi da haɗin kai na taimakawa wajen shawo kan ƙalubale.''',
    englishContent: '''The rainy season was poor, and many families worried about food. Malam Adamu suggested using an unused plot of land. He invited neighbours to work together.

Some cleared weeds, others prepared the soil, and others saved seeds. Children helped water the plants and keep animals away. Not everything was easy: insects damaged some leaves, but the farmers sought expert advice and addressed the problem.

At harvest time, they collected vegetables and grain. They shared food with families who needed it most and saved seeds for the next season. The village learned that knowledge and cooperation help people face challenges.''',
    lesson: 'Ilimi, haɗin kai da raba amfanin gona suna ƙarfafa al’umma.',
    englishLesson: 'Knowledge, cooperation, and sharing strengthen a community.',
  ),
  _story(
    id: '30', title: 'Tafiyar Bilkisu zuwa Sabuwar Makaranta', englishTitle: 'Bilkisu’s First Day at a New School',
    image: 'assets/images/Alheri.jpg', category: 'Tarbiyya',
    description: 'Bilkisu ta koyi yadda za ta yi abokai ta hanyar kyautatawa da ƙarfin hali.',
    englishDescription: 'Bilkisu learns to make friends through kindness and courage.',
    content: '''Bilkisu ta koma wata unguwa, don haka ta fara zuwa sabuwar makaranta. Da safe ta ji kunya, domin ba ta san kowa ba. Ta zauna a ƙarshen aji tana kallon sauran yara suna hira.

Lokacin aikin rukuni, malami ya ce kowa ya gabatar da ra’ayi. Bilkisu ta yi shiru da farko, amma wata yarinya mai suna Rabi ta tambaye ta abin da take tunani. Bilkisu ta ba da shawarar yadda za su tsara hoton da suke zana, kuma ƙungiyar ta yaba mata.

A lokacin hutu, Bilkisu ta raba fensir ɗinta da wani yaro da ya manta nasa. A ƙarshen rana, ta riga ta san sababbin abokai biyu.

Ta fahimci cewa ba dole ba ne ta zama mai magana da yawa don yin abokai; murmushi, sauraro da taimako sun isa su fara.''',
    englishContent: '''Bilkisu had moved to a new neighbourhood and was starting at a new school. That morning she felt shy because she did not know anyone. She sat at the back of the classroom while the other children chatted.

During group work, the teacher asked everyone to share an idea. Bilkisu was quiet at first, but a girl named Rabi asked what she thought. Bilkisu suggested how they could arrange their drawing, and the group liked her idea.

At break time, Bilkisu shared a pencil with a boy who had forgotten his. By the end of the day, she had already made two new friends.

She learned that she did not need to talk all the time to make friends; a smile, listening, and helping were enough to begin.''',
    lesson: 'Ƙarfin hali, sauraro da kyautatawa suna taimaka wajen samun abokai.',
    englishLesson: 'Courage, listening, and kindness help friendships grow.',
  ),

];
