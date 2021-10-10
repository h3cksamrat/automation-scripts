project="$1"
pink=$(tput setaf 5)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
red=$(tput setaf 1)
endc=$(tput sgr0)
bold=$(tput bold)
underline=$(tput smul)

echo "${project}"

npx create-react-app "${project}"
cd "${project}"

echo "${yellow}Dowloading tailwindcss...${endc}"
npm install -D tailwindcss@npm:@tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9
echo "${green}Completed tailwindcss download${endc}"

echo "${yellow}Downloading craco...${endc}"
npm install @craco/craco
echo "${green}Completed craco download${endc}"

echo "${yellow}Editing scripts in package.json${endc}"
sed -iE 's/"start":.*,/"start":"craco start",/g' package.json
sed -iE 's/"build":.*,/"build":"craco build",/g' package.json
sed -iE 's/"test":.*,/"test":"craco test",/g' package.json
echo "${green}Scripts are now using craco${endc}"

echo "${yellow}Craco config files are being made${endc}"
echo "module.exports = {
  style: {
    postcss: {
      plugins: [
        require('tailwindcss'),
        require('autoprefixer'),
      ],
    },
  },
}" > craco.config.js
echo "${green}Craco config files are ready in ${cyan}${bold}craco.config.js${endc}"

echo "${yellow}tailwindcss config is being prepared${endc}"
npx tailwindcss-cli@latest init

sed -iE 's/purge:.*,/purge: \[".\/src\/**\/*.\{js,jsx,ts,tsx\}",".\/public\/index.html",".\/src\/*.\{js,jsx,ts,tsx\}"\],/g' tailwind.config.js
echo "${green}completed with tailwindcss configuration in tailwind.config.js${endc}"

echo "${yellow}Including tailwind to the project...${endc}"
sed -i '1s/^/@tailwind base;\n@tailwind components;\n@tailwind utilities;\n/' src/index.css

echo "${green}Completed with tailwindcss${endc}"

echo "${yellow}Enjoy coding...${endc}"
echo "${yellow}Project: ${project}${endc}"
echo "${pink}Thank you for using our script${endc}"
echo "${red}github: ${underline}https://github.com/h3cksamrat/${endc}"
