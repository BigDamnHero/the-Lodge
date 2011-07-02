# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



##### Core Races ###############################################################
human = Race.create({
  :name => 'Human',
  :description => "Humans possess exceptional drive and a great capacity to endure and expand, and as such are currently the dominant race in the world. Their empires and nations are vast, sprawling things, and the citizens of these societies carve names for themselves with the strength of their sword arms and the power of their spells. Humanity is best characterized by its tumultuousness and diversity, and human cultures run the gamut from savage but honorable tribes to decadent, devil-worshiping noble families in the most cosmopolitan cities. Human curiosity and ambition often triumph over their predilection for a sedentary lifestyle, and many leave their homes to explore the innumerable forgotten corners of the world or lead mighty armies to conquer their neighbors, simply because they can.",
  :physical_description => "The physical characteristics of humans are as varied as the world's climes. From the dark-skinned tribesmen of the southern continents to the pale and barbaric raiders of the northern lands, humans possess a wide variety of skin colors, body types, and facial features. Generally speaking, humans' skin color assumes a darker hue the closer to the equator they live.",
  :society => "Human society comprises a multitude of governments, attitudes, and lifestyles. Though the oldest human cultures trace their histories thousands of years into the past, when compared to the societies of common races like elves and dwarves, human society seems to be in a state of constant flux as empires fragment and new kingdoms subsume the old. In general, humans are known for their flexibility, ingenuity, and ambition.",
  :relations => "Humans are fecund, and their drive and numbers often spur them into contact with other races during bouts of territorial expansion and colonization. In many cases, this leads to violence and war, yet humans are also swift to forgive and forge alliances with races who do not try to match or exceed them in violence. Proud, sometimes to the point of arrogance, humans might look upon dwarves as miserly drunkards, elves as flighty fops, halflings as craven thieves, gnomes as twisted maniacs, and half-elves and half-orcs as embarrassments -- but the race's diversity among its own members also makes humans quite adept at accepting others for what they are.",
  :philosophy => "Humanity is perhaps the most heterogeneous of all the common races, with a capacity for great evil and boundless good. Some assemble into vast barbaric hordes, while others build sprawling cities that cover miles. Taken as a whole, most humans are neutral, yet they generally tend to congregate in nations and civilizations with specific alignments. Humans also have the widest range in gods and religion, lacking other races' ties to tradition and eager to turn to anyone offering them glory or protection.",
  :adventurers => "Ambition alone drives countless humans, and for many, adventuring serves as a means to an end, whether it be wealth, acclaim, social status, or arcane knowledge. A few pursue adventuring careers simply for the thrill of danger. Humans hail from myriad regions and backgrounds, and as such can fill any role within an adventuring party.",
  :names => "Unlike other races, who generally cleave to specific traditions and shared histories, humanity's diversity has resulted in a near-infinite set of names. The humans of a northern barbarian tribe have much different names than those hailing from a subtropical nation of sailors and tradesmen. Throughout most of the world humans speak Common, yet their names are as varied as their beliefs and appearances.",
  :male_names => '',
  :female_names => '',
  :image_url => '/images/races/humans.png',
  :thumb_url => '/images/races/humans_small.png'
}) unless Race.where(:name => 'Human').exists?

dwarf = Race.create({
  :name => 'Dwarf',
  :description => "Dwarves are a stoic but stern race, ensconced in cities carved from the hearts of mountains and fiercely determined to repel the depredations of savage races like orcs and goblins. More than any other race, the dwarves have acquired a reputation as dour and humorless craftsmen of the earth. It could be said that dwarven history shapes the dark disposition of many dwarves, for they reside in high mountains and dangerous realms below the earth, constantly at war with giants, goblins, and other such horrors.",
  :physical_description => "Dwarves are a short and stocky race, and stand about a foot shorter than most humans, with wide, compact bodies that account for their burly appearance. Male and female dwarves pride themselves on the length of their hair, and men often decorate their beards with a variety of clasps and intricate braids. A clean-shaven male dwarf is a sure sign of madness, or worse -- no one familiar with their race trusts a beardless dwarf.",
  :society => "The great distances between their mountain citadels account for many of the cultural differences that exist within dwarven society. Despite these schisms, dwarves throughout the world are characterized by their love of stonework, their passion for stone- and metal-based craftsmanship and architecture, and a fierce hatred of giants, orcs, and goblinoids.",
  :relations => "Dwarves and orcs have long dwelt in proximity, theirs a history of violence as old as both their races. Dwarves generally distrust and shun half-orcs. They find halflings, elves, and gnomes to be too frail, flighty, or \"pretty\" to be worthy of proper respect. It is with humans that dwarves share the strongest link, for humans' industrious nature and hearty appetites come closest to matching those of the dwarven ideal.",
  :philosophy => "Dwarves are driven by honor and tradition, and while they are often satirized as standoffish, they have a strong sense of friendship and justice, and those who win their trust understand that, while they work hard, they play even harder -- especially when good ale is involved. Most dwarves are lawful good.",
  :adventurers => "Although dwarven adventurers are rare compared to humans, they can be found in most regions of the world. Dwarves often leave the confines of their redoubts to seek glory for their clans, to find wealth with which to enrich the fortress-homes of their birth, or to reclaim fallen dwarven citadels from racial enemies. Dwarven warfare is often characterized by tunnel fighting and melee combat, and as such most dwarves tend toward classes such as fighters and barbarians.",
  :names => '',
  :male_names => 'Dolgrin, Grunyar, Harsk, Kazmuk, Morgrym, Rogar',
  :female_names => 'Agna, Bodill, Ingra, Kotri, Rusilka, Yangrit',
  :image_url => '/images/races/dwarves.jpg',
  :thumb_url => '/images/races/dwarves_small.jpg'
}) unless Race.where(:name => 'Dwarf').exists?

elf = Race.create({
  :name => 'Elf',
  :description => "The long-lived elves are children of the natural world, similar in many superficial ways to fey creatures, yet different as well. Elves value their privacy and traditions, and while they are often slow to make friends, at both the personal and national levels, once an outsider is accepted as a comrade, such alliances can last for generations. Elves have a curious attachment to their surroundings, perhaps as a result of their incredibly long lifespans or some deeper, more mystical reason. Elves who dwell in a region for long find themselves physically adapting to match their surroundings, most noticeably taking on coloration reflecting the local environment. Those elves that spend their lives among the short-lived races, on the other hand, often develop a skewed perception of mortality and become morose, the result of watching wave after wave of companions age and die before their eyes.",
  :physical_description => "Although generally taller than humans, elves possess a graceful, fragile physique that is accentuated by their long, pointed ears. Their eyes are wide and almond-shaped, and filled with large, vibrantly colored pupils. While elven clothing often plays off the beauty of the natural world, those elves that live in cities tend to bedeck themselves in the latest fashion.",
  :society => "Many elves feel a bond with nature and strive to live in harmony with the natural world. Most, however, find manipulating earth and stone to be distasteful, and prefer instead to indulge in the finer arts, with their inborn patience making them particularly suited to wizardry.",
  :relations => "Elves are prone to dismissing other races, writing them off as rash and impulsive, yet they are excellent judges of character. An elf might not want a dwarf neighbor, but would be the first to acknowledge that dwarf's skill at smithing. They regard gnomes as strange (and sometimes dangerous) curiosities, and halflings with a measure of pity, for these small folk seem to the elves to be adrift, without a traditional home. Elves are fascinated with humans, as evidenced by the number of half-elves in the world, even if they usually disown such offspring. They regard half-orcs with distrust and suspicion.",
  :philosophy => "Elves are emotional and capricious, yet value kindness and beauty. Most elves are chaotic good.",
  :adventurers => " Many elves embark on adventures out of a desire to explore the world, leaving their secluded forest realms to reclaim forgotten elven magic or search out lost kingdoms established millennia ago by their forefathers. For those raised among humans, the ephemeral and unfettered life of an adventurer holds natural appeal. Elves generally eschew melee because of their frailty, preferring instead to pursue classes such as wizards and rangers.",
  :names => '',
  :male_names => 'Caladrel, Heldalel, Lanliss, Meirdrarel, Seldlon, Talathel, Variel, Zordlon.',
  :female_names => 'Amrunelara, Dardlara, Faunra, Jathal, Merisiel, Oparal, Soumral, Tessara, Yalandlara.',
  :image_url => '/images/races/elves.jpg',
  :thumb_url => '/images/races/elves_small.jpg'
}) unless Race.where(:name => 'Elf').exists?

half_elf = Race.create({
  :name => 'Half Elf',
  :description => "Elves have long drawn the covetous gazes of other races. Their generous life spans, magical affinity, and inherent grace each contribute to the admiration or bitter envy of their neighbors. Of all their traits, however, none so entrance their human associates as their beauty. Since the two races first came into contact with each other, the humans have held up elves as models of physical perfection, seeing in the fair folk idealized versions of themselves. For their part, many elves find humans attractive despite their comparatively barbaric ways, drawn to the passion and impetuosity with which members of the younger race play out their brief lives.\n\nSometimes this mutual infatuation leads to romantic relationships. Though usually short-lived, even by human standards, these trysts commonly lead to the birth of half-elves, a race descended of two cultures yet inheritor of neither. Half-elves can breed with one another, but even these \"pureblood\" half-elves tend to be viewed as bastards by humans and elves alike.",
  :physical_description => "Half-elves stand taller than humans but shorter than elves. They inherit the lean build and comely features of their elven lineage, but their skin color is dictated by their human side. While half-elves retain the pointed ears of elves, theirs are more rounded and less pronounced. A half-elf's human-like eyes tend to range a spectrum of exotic colors running from amber or violet to emerald green and deep blue.",
  :society => "The lack of a unified homeland and culture forces half-elves to remain versatile, able to conform to nearly any environment. While often attractive to both races for the same reasons as their parents, half-elves rarely fit in with either humans or elves, as both races see too much evidence of the other in them. This lack of acceptance weighs heavily on many half-elves, yet others are bolstered by their unique status, seeing in their lack of a formalized culture the ultimate freedom. As a result, half-elves are incredibly adaptable, capable of adjusting their mindsets and talents to whatever societies they find themselves in.",
  :relations => "A half-elf understands loneliness, and knows that character is often less a product of race than of life experience. As such, half-elves are often open to friendships and alliances with other races, and less likely to rely on first impressions when forming opinions of new acquaintances.",
  :philosophy => "Half-elves' isolation strongly influences their characters and philosophies. Cruelty does not come naturally to them, nor does blending in and bending to societal convention -- as a result, most half-elves are chaotic good. Half-elves' lack of a unified culture makes them less likely to turn to religion, but those who do generally follow the common faiths of their homeland.",
  :adventurers => "Half-elves tend to be itinerants, wandering the lands in search of a place they might finally call home. The desire to prove oneself to the community and establish a personal identity -- or even a legacy -- drives many half-elf adventurers to lives of bravery.",
  :names => '',
  :male_names => 'Calathes, Encinal, Kyras, Narciso, Quiray, Satinder, Seltyiel, Zirul.',
  :female_names => 'Cathran, Elsbeth, Iandoli, Kieyanna, Lialda, Maddela, Reda, Tamarie.',
  :image_url => '/images/races/half-elves.jpg',
  :thumb_url => '/images/races/half-elves_small.jpg'
}) unless Race.where(:name => 'Half Elf').exists?

halfling = Race.create({
  :name => 'Halfling',
  :description => "Optimistic and cheerful by nature, blessed with uncanny luck and driven by a powerful wanderlust, halflings make up for their short stature with an abundance of bravado and curiosity. At once excitable and easy-going, halflings like to keep an even temper and a steady eye on opportunity, and are not as prone as some of the more volatile races to violent or emotional outbursts. Even in the jaws of catastrophe, a halfling almost never loses his sense of humor.\n\nHalflings are inveterate opportunists. Unable to physically defend themselves from the rigors of the world, they know when to bend with the wind and when to hide away. Yet a halfling's curiosity often overwhelms his good sense, leading to poor decisions and narrow escapes.\n\nThough their curiosity drives them to travel and seek new places and experiences, halflings possess a strong sense of house and home, often spending above their means to enhance the comforts of home life.",
  :physical_description => "Halflings rise to a humble height of 3 feet. They prefer to walk barefoot, leading to the bottoms of their feet being roughly calloused. Tufts of thick, curly hair warm the tops of their broad, tanned feet. Their skin tends toward a rich almond color and their hair toward light shades of brown. A halfling's ears are pointed, but proportionately not much larger than those of a human.",
  :society => "Halflings claim no cultural homeland and control no settlements larger than rural assemblies of free towns. Far more often, they dwell at the knees of their human cousins in human cities, eking out livings as they can from the scraps of larger societies. Many halflings lead perfectly fulfilling lives in the shadow of their larger neighbors, while some prefer more nomadic lives on the road, traveling the world and experiencing all it has to offer.",
  :relations => "A typical halfling prides himself on his ability to go unnoticed by other races -- it is this trait that allows so many halflings to excel at thievery and trickery. Most halflings, knowing full well the stereotyped view other races take of them as a result, go out of their way to be forthcoming and friendly to the bigger races when they're not trying to go unnoticed. They get along fairly well with gnomes, although most halflings regard these eccentric creatures with a hefty dose of caution. Halflings coexist well with humans as a general rule, but since some of the more aggressive human societies value halflings as slaves, halflings try not to grow too complacent when dealing with them. Halflings respect elves and dwarves, but these races generally live in remote regions far from the comforts of civilization that halflings enjoy, thus limiting opportunities for interaction. Only half-orcs are generally shunned by halflings, for their great size and violent natures are a bit too intimidating for most halflings to cope with.",
  :philosophy => "Halflings are loyal to their friends and families, but since they dwell in a world dominated by races twice as large as themselves, they've come to grips with the fact that sometimes they'll need to scrap and scrounge for survival. Most halflings are neutral as a result.",
  :adventurers => "Their inherent luck coupled with their insatiable wanderlust makes halflings ideal for lives of adventure. Other such vagabonds tend to put up with the curious race in hopes that some of their mystical luck will rub off.",
  :names => "Most halflings have two names: one adhering to the naming conventions of the community they support and one of halfling origin.",
  :male_names => 'Antal, Boram, Chimon, Edal, Elun, Guln, Hakon, Jamir, Kaleb, Karum, Lem, Liek, Mirn, Neg, Rocur, Sumak',
  :female_names => 'Anafa, Bellis, Chandira, Eireen, Etun, Filiu, Giama, Lissa, Marra, Onana, Piria, Rilla, Sistra, Sophone, Vaga, Yamyra',
  :image_url => '/images/races/halflings.jpg',
  :thumb_url => '/images/races/halflings_small.jpg'
}) unless Race.where(:name => 'Halfling').exists?

gnome = Race.create({
  :name => 'Gnome',
  :description => "Gnomes trace their lineage back to the mysterious realm of the fey, a place where colors are brighter, the wildlands wilder, and emotions more primal. Unknown forces drove the ancient gnomes from that realm long ago, forcing them to seek refuge in this world; despite this, the gnomes have never completely abandoned their fey roots or adapted to mortal culture. As a result, gnomes are widely regarded by the other races as alien and strange.",
  :physical_description => "Gnomes are one of the smallest of the common races, generally standing just over 3 feet in height. Their hair tends toward vibrant colors such as the fiery orange of autumn leaves, the verdant green of forests at springtime, or the deep reds and purples of wildflowers in bloom. Similarly, their flesh tones range from earthy browns to floral pinks, frequently with little regard for heredity. Gnomes possess highly mutable facial characteristics, and many have overly large mouths and eyes, an effect which can be both disturbing and stunning, depending on the individual.",
  :society => "Unlike most races, gnomes do not generally organize themselves within classic societal structures. Whimsical creatures at heart, they typically travel alone or with temporary companions, ever seeking new and more exciting experiences. They rarely form enduring relationships among themselves or with members of other races, instead pursuing crafts, professions, or collections with a passion that borders on zealotry. Male gnomes have a strange fondness for unusual hats and headgear, while females often proudly wear elaborate and eccentric hairstyles.",
  :relations => "Gnomes have difficulty interacting with the other races, on both emotional and physical levels. Gnome humor is hard to translate and often comes across as malicious or senseless to other races, while gnomes in turn tend to think of the taller races as dull and lumbering giants. They get along well with halflings and humans, but are overly fond of playing jokes on dwarves and half-orcs, whom most gnomes feel need to lighten up. They respect elves, but often grow frustrated with the comparatively slow pace at which members of the long-lived race make decisions. To the gnomes, action is always better than inaction, and many gnomes carry several highly involved projects with them at all times to keep themselves entertained during rest periods.",
  :philosophy => "Although gnomes are impulsive tricksters, with sometimes inscrutable motives and equally confusing methods, their hearts are generally in the right place. They are prone to powerful fits of emotion, and find themselves most at peace within the natural world.",
  :adventurers => "Gnomes' propensity for wanderlust makes them natural adventurers. They often become wanderers to experience new aspects of life, for nothing is as novel as the uncounted dangers facing adventurers. Gnomes make up for their weakness with a proclivity for sorcery or bardic music.",
  :names => '',
  :male_names => 'Abroshtor, Bastargre, Halungalom, Krolmnite, Poshment, Zarzuket, Zatqualmie.',
  :female_names => 'Besh, Fijit, Lini, Neji, Majet, Pai, Queck, Trig.',
  :image_url => '/images/races/gnomes.jpg',
  :thumb_url => '/images/races/gnomes_small.jpg'
}) unless Race.where(:name => 'Gnome').exists?

half_orc = Race.create({
  :name => 'Half Orc',
  :description => "Half-orcs are monstrosities, their tragic births the result of perversion and violence -- or at least, that's how other races see them. It's true that half-orcs are rarely the result of loving unions, and as such are usually forced to grow up hard and fast, constantly fighting for protection or to make names for themselves. Feared, distrusted, and spat upon, half-orcs still consistently manage to surprise their detractors with great deeds and unexpected wisdom -- though sometimes it's easier just to crack a few skulls.",
  :physical_description => "Both genders of half-orc stand between 6 and 7 feet tall, with powerful builds and greenish or grayish skin. Their canines often grow long enough to protrude from their mouths, and these \"tusks\", combined with heavy brows and slightly pointed ears, give them their notoriously bestial appearance. While half-orcs may be impressive, few ever describe them as beautiful.",
  :society => "Unlike half-elves, where at least part of society's discrimination is born out of jealousy or attraction, half-orcs get the worst of both worlds: physically weaker than their orc kin, they also tend to be feared or attacked outright by the legions of humans who don't bother making the distinction between full orcs and halfbloods. Still, while not exactly accepted, half-orcs in civilized societies tend to be valued for their martial prowess, and orc leaders have actually been known to spawn them intentionally, as the halfbreeds regularly make up for their lack of physical strength with increased cunning and aggression, making them natural chieftains and strategic advisors.",
  :relations => "A lifetime of persecution leaves the average half-orc wary and quick to anger, yet those who break through his savage exterior might find a well-hidden core of empathy. Elves and dwarves tend to be the least accepting of half-orcs, seeing in them too great a resemblance to their racial enemies, but other races aren't much more understanding. Human societies with few orc problems tend to be the most accommodating, and there half-orcs make natural mercenaries and enforcers.",
  :philosophy => "Forced to live either among brutish orcs or as lonely outcasts in civilized lands, most half-orcs are bitter, violent, and reclusive. Evil comes easily to them, but they are not evil by nature -- rather, most half-orcs are chaotic neutral, having been taught by long experience that there's no point doing anything but that which directly benefits themselves.",
  :adventurers => "Staunchly independent, many half-orcs take to lives of adventure out of necessity, seeking to escape their painful pasts or improve their lot through force of arms. Others, more optimistic or desperate for acceptance, take up the mantle of crusaders in order to prove their worth to the world.",
  :names => '',
  :male_names => 'Ausk, Davor, Hakak, Kizziar, Makoa, Nesteruk, Tsadok.',
  :female_names => 'Canan, Drogheda, Goruza, Mazon, Shirish, Tevaga, Zeljka.',
  :image_url => '/images/races/half-orcs.jpg',
  :thumb_url => '/images/races/half-orcs_small.jpg'
}) unless Race.where(:name => 'Half Orc').exists?


##### Monstrous Races ##########################################################

aasimar = Race.create({
  :name => 'Aasimar',
  :description => "Aasimars are humans with a significant amount of celestial or other good outsider blood in their ancestry. Aasimars are not always good, but it is a natural tendency for them, and they gravitate to good faiths or organizations associated with celestials. Aasimar heritage can hide for generations, only to appear suddenly in the child of two apparently human parents. Most societies interpret aasimar births as good omens. Aasimars look mostly human except for some minor physical trait that reveals their unusual heritage. Typical aasimar features are hair that shines like metal, unusual eye or skin color, or even glowing golden halos.",
  :physical_description => '',
  :society => '',
  :relations => '',
  :philosophy => '',
  :adventurers => '',
  :names => '',
  :male_names => '',
  :female_names => '',
  :image_url => '/images/races/aasimars.jpg',
  :thumb_url => '/images/races/aasimars_small.jpg'
}) unless Race.where(:name => 'Aasimar').exists?

tiefling = Race.create({
  :name => 'Tiefling',
  :description => "Tieflings are humans with demonic, devilish, or other evil outsider blood in their ancestry. Often persecuted for their strange appearance and unnatural mannerisms, most tieflings disguise their nature or are forced to live on the fringes or underbelly of civilized society. Though they are not born evil, it is an easy path for them to find, especially as most suffer at the hands of \"normal\" folks while growing up. Tieflings look mostly human except for some physical traits that reveal their strange heritage.",
  :physical_description => '',
  :society => '',
  :relations => '',
  :philosophy => '',
  :adventurers => '',
  :names => '',
  :male_names => '',
  :female_names => '',
  :image_url => '/images/races/tieflings.jpg',
  :thumb_url => '/images/races/tieflings_small.jpg'
}) unless Race.where(:name => 'Tiefling').exists?

drow = Race.create({
  :name => 'Drow',
  :description => "Although related to the elves, the drow are a vile and evil cousin at best. Sometimes called dark elves, these cunning creatures prowl the caves and tunnels of the world below, ruling vast subterranean cities through fear and might. Worshiping demons and enslaving most races they encounter, the drow are among the underworld's most feared and hated denizens.\n\nIn combat, drow are thoroughly ruthless, with little regard for fairness or mercy. They prefer to attack from ambush or to lure enemies into situations where they clearly have the upper hand. If things turn against them, drow are quick to flee, leaving slaves and minions to cover their escape.",
  :physical_description => "Drow are shorter and a bit more slender than their surface-dwelling kin, but they are otherwise physically similar. Drow have dark skin, ranging from black to a hazy purple hue. Most drow have white or silver hair and white or red eyes, but other colors are not unheard of.",
  :society => "Drow society is ruled over by powerful nobility, themselves governed by sadistic and dangerous matriarchs who constantly plot and scheme against rival houses and lesser kin within their own families. The majority of drow are the common soldiers and decadent citizenry, with base stats as presented here -- drow nobles are more powerful and dangerous, and are detailed below.",
  :relations => '',
  :philosophy => '',
  :adventurers => '',
  :names => '',
  :male_names => '',
  :female_names => '',
  :image_url => '/images/races/drow.jpg',
  :thumb_url => '/images/races/drow_small.jpg'
}) unless Race.where(:name => 'Drow').exists?


##### Core Classes #############################################################
barbarian = CharacterClass.create({
  :name => 'Barbarian',
  :description => "For some, there is only rage. In the ways of their people, in the fury of their passion, in the howl of battle, conflict is all these brutal souls know. Savages, hired muscle, masters of vicious martial techniques, they are not soldiers or professional warriors -- they are the battle possessed, creatures of slaughter and spirits of war. Known as barbarians, these warmongers know little of training, preparation, or the rules of warfare; for them, only the moment exists, with the foes that stand before them and the knowledge that the next moment might hold their death. They possess a sixth sense in regard to danger and the endurance to weather all that might entail. These brutal warriors might rise from all walks of life, both civilized and savage, though whole societies embracing such philosophies roam the wild places of the world. Within barbarians storms the primal spirit of battle, and woe to those who face their rage.",
  :role => "Barbarians excel in combat, possessing the martial prowess and fortitude to take on foes seemingly far superior to themselves. With rage granting them boldness and daring beyond that of most other warriors, barbarians charge furiously into battle and ruin all who would stand in their way.",
  :alignment => 'Any non-lawful',
  :hit_die => 12,
  :image_url => '/images/classes/barbarian.jpg',
  :thumb_url => '/images/classes/barbarian_small.jpg'
}) unless Character.where(:name => 'Barbarian').exists?

bard = CharacterClass.create({
  :name => 'Bard',
  :description => "Untold wonders and secrets exist for those skillful enough to discover them. Through cleverness, talent, and magic, these cunning few unravel the wiles of the world, becoming adept in the arts of persuasion, manipulation, and inspiration. Typically masters of one or many forms of artistry, bards possess an uncanny ability to know more than they should and use what they learn to keep themselves and their allies ever one step ahead of danger. Bards are quick-witted and captivating, and their skills might lead them down many paths, be they gamblers or jacks-of-all-trades, scholars or performers, leaders or scoundrels, or even all of the above. For bards, every day brings its own opportunities, adventures, and challenges, and only by bucking the odds, knowing the most, and being the best might they claim the treasures of each.",
  :role => "Bards capably confuse and confound their foes while inspiring their allies to ever-greater daring. While accomplished with both weapons and magic, the true strength of bards lies outside melee, where they can support their companions and undermine their foes without fear of interruptions to their performances.",
  :alignment => 'Any',
  :hit_die => 8,
  :image_url => '/images/classes/bard.jpg',
  :thumb_url => '/images/classes/bard_small.jpg'
}) unless Character.where(:name => 'Bard').exists?

cleric = CharacterClass.create({
  :name => 'Cleric',
  :description => "In faith and the miracles of the divine, many find a greater purpose. Called to serve powers beyond most mortal understanding, all priests preach wonders and provide for the spiritual needs of their people. Clerics are more than mere priests, though; these emissaries of the divine work the will of their deities through strength of arms and the magic of their gods. Devoted to the tenets of the religions and philosophies that inspire them, these ecclesiastics quest to spread the knowledge and influence of their faith. Yet while they might share similar abilities, clerics prove as different from one another as the divinities they serve, with some offering healing and redemption, others judging law and truth, and still others spreading conflict and corruption. The ways of the cleric are varied, yet all who tread these paths walk with the mightiest of allies and bear the arms of the gods themselves.",
  :role => "More than capable of upholding the honor of their deities in battle, clerics often prove stalwart and capable combatants. Their true strength lies in their capability to draw upon the power of their deities, whether to increase their own and their allies' prowess in battle, to vex their foes with divine magic, or to lend healing to companions in need.As their powers are influenced by their faith, all clerics must focus their worship upon a divine source. While the vast majority of clerics revere a specific deity, a small number dedicate themselves to a divine concept worthy of devotion -- such as battle, death, justice, or knowledge -- free of a deific abstraction. (Work with your GM if you prefer this path to selecting a specific deity.)",
  :alignment => 'A cleric\'s alignment must be within one step of her deity\'s, along either the law/chaos axis or the good/evil axis.',
  :hit_die => 8,
  :image_url => '/images/classes/cleric.jpg',
  :thumb_url => '/images/classes/cleric_small.jpg'
}) unless Character.where(:name => 'Cleric').exists?

druid = CharacterClass.create({
  :name => 'Druid',
  :description => "Within the purity of the elements and the order of the wilds lingers a power beyond the marvels of civilization. Furtive yet undeniable, these primal magics are guarded over by servants of philosophical balance known as druids. Allies to beasts and manipulators of nature, these often misunderstood protectors of the wild strive to shield their lands from all who would threaten them and prove the might of the wilds to those who lock themselves behind city walls. Rewarded for their devotion with incredible powers, druids gain unparalleled shape-shifting abilities, the companionship of mighty beasts, and the power to call upon nature's wrath. The mightiest temper powers akin to storms, earthquakes, and volcanoes with primeval wisdom long abandoned and forgotten by civilization.",
  :role => "While some druids might keep to the fringe of battle, allowing companions and summoned creatures to fight while they confound foes with the powers of nature, others transform into deadly beasts and savagely wade into combat. Druids worship personifications of elemental forces, natural powers, or nature itself. Typically this means devotion to a nature deity, though druids are just as likely to revere vague spirits, animalistic demigods, or even specific awe-inspiring natural wonders.",
  :alignment => 'Any neutral',
  :hit_die => 8,
  :image_url => '/images/classes/druid.jpg',
  :thumb_url => '/images/classes/druid_small.jpg'
}) unless Character.where(:name => 'Druid').exists?

fighter = CharacterClass.create({
  :name => 'Fighter',
  :description => "Some take up arms for glory, wealth, or revenge. Others do battle to prove themselves, to protect others, or because they know nothing else. Still others learn the ways of weaponcraft to hone their bodies in battle and prove their mettle in the forge of war. Lords of the battlefield, fighters are a disparate lot, training with many weapons or just one, perfecting the uses of armor, learning the fighting techniques of exotic masters, and studying the art of combat, all to shape themselves into living weapons. Far more than mere thugs, these skilled warriors reveal the true deadliness of their weapons, turning hunks of metal into arms capable of taming kingdoms, slaughtering monsters, and rousing the hearts of armies. Soldiers, knights, hunters, and artists of war, fighters are unparalleled champions, and woe to those who dare stand against them.",
  :role => "Fighters excel at combat -- defeating their enemies, controlling the flow of battle, and surviving such sorties themselves. While their specific weapons and methods grant them a wide variety of tactics, few can match fighters for sheer battle prowess.",
  :alignment => 'Any',
  :hit_die => 10,
  :image_url => '/images/classes/fighter.jpg',
  :thumb_url => '/images/classes/fighter_small.jpg'
}) unless Character.where(:name => 'Fighter').exists?

monk = CharacterClass.create({
  :name => 'Monk',
  :description => "For the truly exemplary, martial skill transcends the battlefield -- it is a lifestyle, a doctrine, a state of mind. These warrior-artists search out methods of battle beyond swords and shields, finding weapons within themselves just as capable of crippling or killing as any blade. These monks (so called since they adhere to ancient philosophies and strict martial disciplines) elevate their bodies to become weapons of war, from battle-minded ascetics to self-taught brawlers. Monks tread the path of discipline, and those with the will to endure that path discover within themselves not what they are, but what they are meant to be.",
  :role => "Monks excel at overcoming even the most daunting perils, striking where it's least expected, and taking advantage of enemy vulnerabilities. Fleet of foot and skilled in combat, monks can navigate any battlefield with ease, aiding allies wherever they are needed most.",
  :alignment => 'Any lawful',
  :hit_die => 8,
  :image_url => '/images/classes/monk.jpg',
  :thumb_url => '/images/classes/monk_small.jpg'
}) unless Character.where(:name => 'Monk').exists?

paladin = CharacterClass.create({
  :name => 'Paladin',
  :description => "Through a select, worthy few shines the power of the divine. Called paladins, these noble souls dedicate their swords and lives to the battle against evil. Knights, crusaders, and law-bringers, paladins seek not just to spread divine justice but to embody the teachings of the virtuous deities they serve. In pursuit of their lofty goals, they adhere to ironclad laws of morality and discipline. As reward for their righteousness, these holy champions are blessed with boons to aid them in their quests: powers to banish evil, heal the innocent, and inspire the faithful. Although their convictions might lead them into conflict with the very souls they would save, paladins weather endless challenges of faith and dark temptations, risking their lives to do right and fighting to bring about a brighter future.",
  :role => "Paladins serve as beacons for their allies within the chaos of battle. While deadly opponents of evil, they can also empower goodly souls to aid in their crusades. Their magic and martial skills also make them well suited to defending others and blessing the fallen with the strength to continue fighting.",
  :alignment => 'Lawful good',
  :hit_die => 10,
  :image_url => '/images/classes/paladin.jpg',
  :thumb_url => '/images/classes/paladin_small.jpg'
}) unless Character.where(:name => 'Paladin').exists?

ranger = CharacterClass.create({
  :name => 'Ranger',
  :description => "For those who relish the thrill of the hunt, there are only predators and prey. Be they scouts, trackers, or bounty hunters, rangers share much in common: unique mastery of specialized weapons, skill at stalking even the most elusive game, and the expertise to defeat a wide range of quarries. Knowledgeable, patient, and skilled hunters, these rangers hound man, beast, and monster alike, gaining insight into the way of the predator, skill in varied environments, and ever more lethal martial prowess. While some track man-eating creatures to protect the frontier, others pursue more cunning game -- even fugitives among their own people.",
  :role => "Rangers are deft skirmishers, either in melee or at range, capable of skillfully dancing in and out of battle. Their abilities allow them to deal significant harm to specific types of foes, but their skills are valuable against all manner of enemies.",
  :alignment => 'Any',
  :hit_die => 10,
  :image_url => '/images/classes/ranger.jpg',
  :thumb_url => '/images/classes/ranger_small.jpg'
}) unless Character.where(:name => 'Ranger').exists?

rogue = CharacterClass.create({
  :name => 'Rogue',
  :description => "Life is an endless adventure for those who live by their wits. Ever just one step ahead of danger, rogues bank on their cunning, skill, and charm to bend fate to their favor. Never knowing what to expect, they prepare for everything, becoming masters of a wide variety of skills, training themselves to be adept manipulators, agile acrobats, shadowy stalkers, or masters of any of dozens of other professions or talents. Thieves and gamblers, fast talkers and diplomats, bandits and bounty hunters, and explorers and investigators all might be considered rogues, as well as countless other professions that rely upon wits, prowess, or luck. Although many rogues favor cities and the innumerable opportunities of civilization, some embrace lives on the road, journeying far, meeting exotic people, and facing fantastic danger in pursuit of equally fantastic riches. In the end, any who desire to shape their fates and live life on their own terms might come to be called rogues.",
  :role => "Rogues excel at moving about unseen and catching foes unaware, and tend to avoid head-to-head combat. Their varied skills and abilities allow them to be highly versatile, with great variations in expertise existing between different rogues. Most, however, excel in overcoming hindrances of all types, from unlocking doors and disarming traps to outwitting magical hazards and conning dull-witted opponents.",
  :alignment => 'Any',
  :hit_die => 8,
  :image_url => '/images/classes/rogue.jpg',
  :thumb_url => '/images/classes/rogue_small.jpg'
}) unless Character.where(:name => 'Rogue').exists?

sorcerer = CharacterClass.create({
  :name => 'Sorcerer',
  :description => "Scions of innately magical bloodlines, the chosen of deities, the spawn of monsters, pawns of fate and destiny, or simply flukes of fickle magic, sorcerers look within themselves for arcane prowess and draw forth might few mortals can imagine. Emboldened by lives ever threatening to be consumed by their innate powers, these magic-touched souls endlessly indulge in and refine their mysterious abilities, gradually learning how to harness their birthright and coax forth ever greater arcane feats. Just as varied as these innately powerful spellcasters' abilities and inspirations are the ways in which they choose to utilize their gifts. While some seek to control their abilities through meditation and discipline, becoming masters of their fantastic birthright, others give in to their magic, letting it rule their lives with often explosive results. Regardless, sorcerers live and breathe that which other spellcasters devote their lives to mastering, and for them magic is more than a boon or a field of study; it is life itself.",
  :role => "Sorcerers excel at casting a selection of favored spells frequently, making them powerful battle mages. As they become familiar with a specific and ever-widening set of spells, sorcerers often discover new and versatile ways of making use of magics other spellcasters might overlook. Their bloodlines also grant them additional abilities, assuring that no two sorcerers are ever quite alike.",
  :alignment => 'Any',
  :hit_die => '6',
  :image_url => '/images/classes/sorcerer.jpg',
  :thumb_url => '/images/classes/sorcerer_small.jpg'
}) unless Character.where(:name => 'Sorcerer').exists?

wizard = CharacterClass.create({
  :name => 'Wizard',
  :description => "Beyond the veil of the mundane hide the secrets of absolute power. The works of beings beyond mortals, the legends of realms where gods and spirits tread, the lore of creations both wondrous and terrible -- such mysteries call to those with the ambition and the intellect to rise above the common folk to grasp true might. Such is the path of the wizard. These shrewd magic-users seek, collect, and covet esoteric knowledge, drawing on cultic arts to work wonders beyond the abilities of mere mortals. While some might choose a particular field of magical study and become masters of such powers, others embrace versatility, reveling in the unbounded wonders of all magic. In either case, wizards prove a cunning and potent lot, capable of smiting their foes, empowering their allies, and shaping the world to their every desire.",
  :role => "While universalist wizards might study to prepare themselves for any manner of danger, specialist wizards research schools of magic that make them exceptionally skilled within a specific focus. Yet no matter their specialty, all wizards are masters of the impossible and can aid their allies in overcoming any danger.",
  :alignment => 'Any',
  :hit_die => 6,
  :image_url => '/images/classes/wizard.jpg',
  :thumb_url => '/images/classes/wizard_small.jpg'
}) unless Character.where(:name => 'Wizard').exists?
