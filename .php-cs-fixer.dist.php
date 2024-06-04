<?php

declare(strict_types=1);

use PhpCsFixer\Config;
use PhpCsFixer\Finder;

// Documentation for PHP CS Fixer can be found at https://github.com/FriendsOfPHP/PHP-CS-Fixer

$rules = [
    /** These definitions can be found at @see RuleSet */
    'blank_line_before_statement' => true,
    'class_definition' => [
        'multi_line_extends_each_single_line' => true,
        'single_item_single_line' => false,
        'single_line' => false,
    ],
    'concat_space' => false,
    'phpdoc_align' => false,
    'phpdoc_to_comment' => false,
    'single_line_throw' => false,
    'phpdoc_separation' => [
        'groups' => [
            ['deprecated', 'link', 'see', 'since'],
            ['author', 'copyright', 'license'],
            ['category', 'package', 'subpackage'],
            ['property', 'property-read', 'property-write'],
        ],
        'skip_unlisted_annotations' => true,
    ],
    'no_unused_imports' => true,
];

$finder = Finder::create()
    ->in(__DIR__)
    ->exclude([
        '.cache',
        'var',
        'vendor',
    ])
    ->notPath('config/bundles.php')
    ->ignoreDotFiles(false)
    ->files();

return (new Config())
    ->setRiskyAllowed(false)
    ->setUsingCache(true)
    ->setCacheFile(__DIR__ . '/.cache/.php-cs-fixer.cache')
    ->setRules($rules)
    ->setFinder($finder);
