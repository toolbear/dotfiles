adjectives = %w[active analytical animated bouncy busy careful cautious cheerful
                clever confident dedicated devoted diligent dogmatic dynamic eager
                ebullient elaborate enthusiastic exacting fast fastidious fierce fussy
                hale industrious intense jolly keen levelheaded logical methodical
                meticulous pedantic peppy perky persevering powerful proud prudent
                punctual rational resolute rigorous robust serious spry steadfast
                steady strong sturdy tenacious thorough tiny tireless unflagging
                upbeat vibrant vigorous vivacious wise woofy zealous zestful]
nouns      = %w[architect axle bailiff beam blade board bolt caliper
                camshaft cantilever cart clamp cogwheel cotterpin crane crankshaft
                crosscut crusty derrick doodad drillbit driver flange flex
                forklift gadget gavel hammer hammerhead jigsaw lever lock
                lugnut miter modem molly pickaxe piledriver pipewrench protractor
                pulley puttyknife ratchet rhinestone rotary sandpaper saw scoop
                screw sledgehammer socket socketwrench spike square thingamabob toggle
                torch treadmill trowel tumbrel turbo tweezer wingnut wrench]

Facter.add('doozer') do
  setcode do
    srand Facter.value(:macaddress).gsub(/:/,'').hex
    "#{adjectives[rand 64]}-#{nouns[rand 64]}-#{rand(10_000-1_000)+1_000}"
  end
end
