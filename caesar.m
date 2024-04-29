function cipher_text =  caesar(clear_text, key)
    % CAESAR Apply caesar cipher in a text for English alphabet.
    %   cipher_text = CAESAR(clear_text, key, is_spanish) 
    % Params
    %   clear_next -> str: message text to cipher 
    %   key        -> int: offset value
    %
    %
    %   Example:
    %       clear_text = 'Hello';
    %       key = 3;
    %       cipher_text = caesar(clear_text, key);
    %       OUT: Khoor

    % create a new zero vector for result 
    cipher_text = zeros(1, length(clear_text));
    % for each letter in clear text
    for i = 1:length(clear_text)
        % only process the character if is a letter
        if isletter(clear_text(i))
            ascii_code = double(clear_text(i)); % get  letter ascii code
            base = 0; % initial code (use to normalize values)
            if (ascii_code >= 65 && ascii_code <= 90) || ascii_code == 209
                base = 65;
            elseif (ascii_code >= 97 && ascii_code <= 122) || ascii_code == 241
                base = 97; % initial lowercase letter ascii code
            end
            % calculate new ascii code by the key
            cipher_code = mod(ascii_code - base + key, 26) + base;
            % replace a zero for cipher code in the same position
            cipher_text(i) = cipher_code;
        else
            % replace a zero for the same character in the same potision
            cipher_text(i) = clear_text(i);
        end
    end
    % transform all numbers in characters
    cipher_text = char(cipher_text);
end
