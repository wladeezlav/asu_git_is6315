audioBranch=feature/audio_effects
typefaceBranch=feature/add_typeface
altBranch=alternative

# ==================

git init

# ===================
# master 1
# ===================

cp data/master_1/* .
cp data/master_1/.idea -r .
git add .idea index.html LICENSE README.md
git commit -m"init commit"

# ===================
# master 2
# ===================

cp data/master_2/* .
git add game.js
git commit -m"add sprite part"

git branch $altBranch

# ===================
# master 3
# ===================

cat data/master_3/game.js >> game.js
git add game.js
git commit -m"add ship"

git branch $audioBranch

# ===================
# master 4
# ===================

cat data/master_4/game.js >> game.js
git add game.js
git commit -m"finish all game logic"

# ===================
# typefaceBranch 1
# ===================

git checkout -b $typefaceBranch
cp data/add_typeface/* .
git add vector_battle_regular.typeface.js
git commit -m"added glyphs"

git checkout master
git merge --no-ff $typefaceBranch -m"Merge branch '$typefaceBranch'"

# ===================
# audioBranch 1
# ===================

git checkout $audioBranch

cp data/audio_effects/39459__THE_bizniss__laser.wav .
git add 39459__THE_bizniss__laser.wav
git commit -m"add laser audio"

# ===================
# audioBranch 2
# ===================

cp data/audio_effects/51467__smcameron__missile_explosion.wav .
git add 51467__smcameron__missile_explosion.wav
git commit -m"add crash audio file"

git checkout master
git merge --no-ff $audioBranch -m"Merge branch '$audioBranch'"

# ===================
# master 5
# ===================

cp data/master_5/* .
git add ipad.js jquery-1.4.1.min.js
git commit -m"added all needed staff"

# ===================
# alternative 1
# ===================

git checkout $altBranch
yes | cp -f data/alternative/game.js .
git add game.js
git commit -m"add brake"

# ===================
# clean-up
# ===================

git checkout master

rm -r data
rm install.sh
