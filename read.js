const axios = require('axios');
const fs = require('fs');
// Function to fetch data from an API
async function fetchData() {
    try {
        const response = await axios.get('https://api.github.com/users/AmauryJRe/repos');
        const data = response.data;
        const filteredData = data.map(repo => repo.full_name);

        filteredData.forEach(element => {
            console.log(element);
            fs.writeFileSync('list.txt', element+"\n", { encoding: 'utf8',flag:'a'});

        });

        // Write data to a file
        // fs.writeFile('list.txt', JSON.stringify(filteredData, null, 2), (err) => {
        //     if (err) {
        //         console.error('Error writing to file', err);
        //     } else {
        //         console.log('File written successfully');
        //     }
        // });
    } catch (error) {
        console.error('Error fetching data', error);
    }
}

fetchData();
