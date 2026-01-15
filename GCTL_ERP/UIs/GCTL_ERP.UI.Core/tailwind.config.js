/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./Views/**/*.cshtml",
        "./Pages/**/*.cshtml",
        "./Areas/**/*.cshtml",
        "./wwwroot/js/**/*.js"
    ],
    // Prefix যোগ করা হয়েছে Bootstrap এর সাথে conflict এড়াতে
    prefix: 'tw-',

    // Bootstrap এর সাথে conflict এড়াতে
    corePlugins: {
        preflight: false, // Bootstrap এর reset/normalize এর সাথে conflict হবে না
    },

    theme: {
        extend: {},
    },
    plugins: [],
};