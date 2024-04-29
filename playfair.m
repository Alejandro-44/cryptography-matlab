function cipher_text = playfair(clear_text, key_text, null_letter)
    %PLAYFAIR Summary of this function goes here
    %   Detailed explanation goes here
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    key_letters = unique(strrep(upper(key_text), ' ', ''), 'stable');
    letters_difference = setdiff(alphabet, key_letters, 'stable');
    key_set = [key_letters letters_difference];
    i_pos = find(key_set == 'I');
    j_pos = find(key_set == 'J');
    if i_pos < j_pos
        key_set = strrep(key_set, 'J', '');
    else
        key_set = strrep(key_set, 'I', '');
    end

    key_matrix = reshape(key_set, 5, 5)';
    
    clear_text = strrep(upper(clear_text), ' ', '');  
    if mod(length(clear_text), 2) ~= 0
        clear_text = [clear_text null_letter];
    end
   
    cipher_text = zeros(1, length(clear_text));
    for n=1:2:length(clear_text)
        ord_pair = clear_text(n:n+1);
        if ord_pair(1) == ord_pair(2)
            ord_pair(2) = null_letter;
        end

        [row_1, col_1] = find(key_matrix == ord_pair(1));
        [row_2, col_2] = find(key_matrix == ord_pair(2));

        if col_1 == col_2
            row_1 = row_1 + 1;
            if row_1 == 6
                row_1 = 1;
            end
            row_2 = row_2 + 1;
            if row_2 == 6
                row_2 = 1;
            end
        elseif row_1 == row_2
            col_1 = col_1 + 1;
            if col_1 == 6
                col_1 = 1;
            end
            col_2 = col_2 + 1;
            if col_2 == 6
                col_2 = 1;
            end
        else
            temp = col_1;
            col_1 = col_2;
            col_2 = temp;
        end
        new_pair = [key_matrix(row_1, col_1) key_matrix(row_2, col_2)];
        cipher_text(n:n+1) = new_pair;
    end
    cipher_text = char(cipher_text);
end