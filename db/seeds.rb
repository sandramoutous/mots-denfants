puts "Nettoyage des données existantes..."
Word.destroy_all
Child.destroy_all
User.destroy_all

puts "Création de l'utilisateur de démo..."
demo_user = User.create!(
  email: "demo@mots-denfants.fr",
  password: "password123",
  password_confirmation: "password123"
)

puts "Création des enfants..."
lea = demo_user.children.create!(
  name: "Léa",
  date_of_birth: 14.months.ago
)

noe = demo_user.children.create!(
  name: "Noé",
  date_of_birth: 2.years.ago
)

puts "Ajout des mots de Léa..."
[
  { baby_version: "mani", real_meaning: "merci", context: "Le disait à chaque fin de repas, en tendant son assiette vide.", said_on: 10.months.ago },
  { baby_version: "papon", real_meaning: "papa est parti", context: nil, said_on: 9.months.ago },
  { baby_version: "doudou lolo", real_meaning: "sa peluche préférée, un lapin", context: "Impossible de dormir sans.", said_on: 8.months.ago },
  { baby_version: "core", real_meaning: "encore", context: "Pour redemander de la compote, en boucle.", said_on: 7.months.ago },
  { baby_version: "nan nan", real_meaning: "non", context: nil, said_on: 6.months.ago },
  { baby_version: "mimi", real_meaning: "le chat des voisins", context: "Elle l'appelait comme ça avant de savoir dire son vrai nom.", said_on: 4.months.ago },
  { baby_version: "reva", real_meaning: "au revoir", context: nil, said_on: 1.month.ago }
].each { |word| lea.words.create!(word) }

puts "Ajout des mots de Noé..."
[
  { baby_version: "pab", real_meaning: "papa", context: nil, said_on: 18.months.ago },
  { baby_version: "yon", real_meaning: "ballon", context: "Criait ça dès qu'il voyait quelque chose de rond.", said_on: 15.months.ago },
  { baby_version: "co co", real_meaning: "encore", context: nil, said_on: 13.months.ago },
  { baby_version: "dou", real_meaning: "doudou", context: nil, said_on: 11.months.ago },
  { baby_version: "byoum", real_meaning: "voiture", context: "Toujours accompagné du bruit de moteur.", said_on: 8.months.ago },
  { baby_version: "gato", real_meaning: "gâteau", context: nil, said_on: 4.months.ago }
].each { |word| noe.words.create!(word) }

puts "Création d'un second utilisateur (pour vérifier l'isolation des données)..."
other_user = User.create!(
  email: "autre@mots-denfants.fr",
  password: "password123",
  password_confirmation: "password123"
)

other_user.children.create!(name: "Zoé", date_of_birth: 1.year.ago).tap do |child|
  child.words.create!(baby_version: "mama", real_meaning: "maman", context: nil, said_on: 2.months.ago)
end

puts "✓ Seeds terminées :"
puts "  - #{User.count} utilisateurs"
puts "  - #{Child.count} enfants"
puts "  - #{Word.count} mots"
puts ""
puts "Connexion démo : demo@mots-denfants.fr / password123"
