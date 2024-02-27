function keyboardDrivenLizardAnimation()
    % Define initial base point
    p1_0 = [0; 0];

    % Two unique set of angles for controlling [head,tail] and [limbs]
    thetas = [pi/6,pi/12,0,-pi/12,-pi/6];
    alphas = [-pi/6,-pi/12,0,pi/12,pi/6];

    % Rotation Function
    function R1 = rotation1(theta) 
        R1 = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    end
    
    % Create a figure and attach the KeyPressFcn
    fig = figure;
    set(fig, 'KeyPressFcn', @keyPressed);

    i=2;
    flag=0;
    function updatePlot(p1_0)

        % Choosing current angle from list
        theta = thetas(i);
        alpha = alphas(i);

        % Point definitions as per formula
        th1 = theta;
        p2_1 = [1; 0];
        p2_0 = rotation1(th1)*p2_1 + p1_0;

        th2 = -theta;
        p3_2 = [1; 0];
        p3_1 = rotation1(th2)*p3_2 + p2_1;
        p3_0 = rotation1(th1)*p3_1 + p1_0;

        th3 = theta;
        p4_3 = [1; 0];
        p4_2 = rotation1(th3)*p4_3 + p3_2;
        p4_1 = rotation1(th2)*p4_2 + p2_1;
        p4_0 = rotation1(th1)*p4_1 + p1_0;

        th4 = alpha-theta;
        p5_2 = [0; 0.5];
        p5_1 = rotation1(th4)*p5_2 + p2_1;
        p5_0 = rotation1(th1)*p5_1 + p1_0;

        th5 = alpha-theta;
        p6_2 = [0; -0.5];
        p6_1 = rotation1(th5)*p6_2 + p2_1;
        p6_0 = rotation1(th1)*p6_1 + p1_0;

        th6 = -alpha-theta;
        p7_3 = [0; 0.5];
        p7_1 = rotation1(th6)*p7_3 + p3_1;
        p7_0 = rotation1(th1)*p7_1 + p1_0;

        th7 = -alpha-theta;
        p8_3 = [0; -0.5];
        p8_1 = rotation1(th7)*p8_3 + p3_1;
        p8_0 = rotation1(th1)*p8_1 + p1_0;

        % Plot the lizard
        hold on;
        plot([p1_0(1), p2_0(1)], [p1_0(2), p2_0(2)], 'k');
        plot([p2_0(1), p3_0(1)], [p2_0(2), p3_0(2)], 'k');
        plot([p3_0(1), p4_0(1)], [p3_0(2), p4_0(2)], 'k');
        plot([p2_0(1), p5_0(1)], [p2_0(2), p5_0(2)], 'k');
        plot([p2_0(1), p6_0(1)], [p2_0(2), p6_0(2)], 'k');
        plot([p3_0(1), p7_0(1)], [p3_0(2), p7_0(2)], 'k');
        plot([p3_0(1), p8_0(1)], [p3_0(2), p8_0(2)], 'k');
        axis equal;
        hold off;
        
        xlim([-6, 6]); ylim([-6, 6]);

        % Updating index (in first-to-last-then-reverse fashion)
        if flag==0
            if i~=5
                i=i+1;
            else
                flag=1;
                i=i-1;
            end
        else
            if i~=1
                i=i-1;
            else
                flag=0;
                i=i+1;
            end
        end
    end

    function keyPressed(~, event)
        % Detect arrow keys and update base point accordingly
        switch event.Key
            case 'rightarrow'
                p1_0(1) = p1_0(1) + 0.3; % Increment X-axis
            case 'leftarrow'
                p1_0(1) = p1_0(1) - 0.3; % Decrement X-axis
            case 'uparrow'
                p1_0(2) = p1_0(2) + 0.3; % Increment Y-axis
            case 'downarrow'
                p1_0(2) = p1_0(2) - 0.3; % Decrement Y-axis
        end
        % Update the plot with the new base point
        clf
        updatePlot(p1_0);
    end

    % Initial plot
    updatePlot(p1_0);
end
