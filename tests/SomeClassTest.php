<?php

declare(strict_types=1);

namespace JefvdA\InitialPhpPackage\Tests;

use JefvdA\InitialPhpPackage\SomeClass;
use PHPUnit\Framework\TestCase;

final class SomeClassTest extends TestCase
{
    public function testReturnTrueActuallyReturnsTrue(): void
    {
        // Given
        $someClass = new SomeClass();

        // Then
        self::assertTrue($someClass->returnTrue());
    }
}