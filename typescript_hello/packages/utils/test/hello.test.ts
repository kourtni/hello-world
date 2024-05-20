import { test, expect } from 'vitest';
import { greet } from '../src/hello';

test('greet should return greeting with name.', () => {
    expect(greet('Tom')).toBe('Hello, Tom!');
})