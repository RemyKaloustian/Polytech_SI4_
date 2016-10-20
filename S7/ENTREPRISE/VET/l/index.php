<?php
    $dev = true;

    if ($dev) { // If dev mode, display errors
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
    } else { // Else, hide
        ini_set('display_errors', 0);
        ini_set('display_startup_errors', 0);
        error_reporting(0);
    }

    // Constant
    DEFINE('FILE', 'articles.json');

    // Load the json datas
    $json = json_decode(file_get_contents(FILE, "r"), TRUE);

    if (isset($_GET['url']) && !empty($_GET['url'])) { // If we have the url
        if (empty($json))                   die('Fatal error');
        
        // The url
        $url = strip_tags($_GET['url']);
        
        if (array_key_exists($url, $json))  header('Location: '.$json[$url]); // If the url is correct (the key), go to the page!
        else                                die('404 Not Found'); // Error

    } elseif (isset($_GET['admin']) && strip_tags($_GET['admin']) === 'RemyAdrianCoeur') { // Admin mode, password 'RemyAdrianCoeur'
        $k = strip_tags($_GET['key']); // The key
        $v = strip_tags($_GET['value']); // The value (url)

        if (isset($k) && !empty($k)
            && isset($v) && !empty($v)) {
            $json[$k] = $v; // Add

            // Save the datas
            file_put_contents(FILE, json_encode($json));

            echo 'Added successfully!';
        }
    } else // No url found...
        die(':-(');
?>

