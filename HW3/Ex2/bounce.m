function bounce(npts, vmin, vmax, radius, center)

    % Initial direction/velocity of the points
    direction = rand(npts, 1) * 2 *pi;
    velocity = (rand(npts, 1) * (vmax - vmin)) + vmin;

    % Create random starting locations within the circle
    theta = rand(npts, 1) * 2*pi;
    r = radius * sqrt(rand(npts, 1));

    XY = [r .* cos(theta(:)) + center(1), ...
          r .* sin(theta(:)) + center(2)];

    % Initial plot objects
    hfig = figure('Color', 'w');
    hax = axes('Parent', hfig);

    % Plot the dots as black markers
    hdots = plot(XY(:,1), XY(:,2), ...
                'Parent', hax, ...
                'Marker', '.', ...
                'Color', 'k', ...
                'LineStyle', 'none', ...
                'MarkerSize', 12);

    hold(hax, 'on')
    axis(hax, 'equal')

    % Plot the circle as a reference
    t = linspace(0, 2*pi, 100);
    plot(radius * cos(t) + center(1), ...
         radius * sin(t) + center(2))

    % Keep simulating until we actually close the window
    while ishghandle(hfig);
        % Determine new dot locations
        [XY, direction] = step(XY, direction, velocity, radius, center);

        % Update the dot plot to reflect new locations
        set(hdots, 'XData', XY(:,1), 'YData', XY(:,2))

        % Force a redraw
        drawnow
    end
end

function [XYnew, direction] = step(XY, direction, velocity, radius, center)
    % Compute the next position of the points
    DX = [cos(direction(:)) .* velocity, ...
          sin(direction(:)) .* velocity];
    XYnew = XY + DX;

    % Now check that they are all inside circle
    isOutside = sum(bsxfun(@minus, XYnew, center).^2, 2) > radius^2;

    % The ones that are outside should "bounce" back into the circle
    if any(isOutside)        
        orig  = XY(isOutside,:);
        new   = XYnew(isOutside,:);
        delta = -DX(isOutside,:);

        % Find intersection of this path with the circle
        % Taken from: https://math.stackexchange.com/a/311956
        a = sum(delta.^2, 2);
        b = sum(2 .* delta .* bsxfun(@minus, orig, center), 2);
        c = sum(bsxfun(@minus, orig, center).^2, 2) - radius^2;

        t = (2 * c) ./ (-b + sqrt(b.^2 - 4 .* a .* c)); 
        xintersect = orig(:,1) + delta(:,1) .* t;
        yintersect = orig(:,2) + delta(:,2) .* t;

        % Get tangent at this intersection (slope/intercept form)
        m = - 1 ./ ((yintersect - center(2)) ./ (xintersect - center(1)));
        b = yintersect - m .* xintersect;

        % "Reflect" outside points across the tangent line to "bounce" them
        % Equations from: https://stackoverflow.com/a/3307181/670206
        d = (new(:,1) + (new(:,2) - b) .* m) ./ (1 + m.^2);

        XYnew(isOutside,1) = 2 * d - new(:,1);
        XYnew(isOutside,2) = 2 .* d .* m - new(:,2) + 2 .* b;

        % Recompute the direction of the particles that "bounced"
        direction(isOutside) = atan2(XYnew(isOutside,2) - yintersect, ...
                                     XYnew(isOutside,1) - xintersect);
    end
end
%The Result
%By running the following command I was able to obtain the following result.
%bounce(100, 0.01, 0.2, 5, [0 0]);