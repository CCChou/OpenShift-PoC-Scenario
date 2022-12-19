package org.acme.kafka;

import javax.enterprise.context.ApplicationScoped;

import org.eclipse.microprofile.reactive.messaging.Incoming;
import org.eclipse.microprofile.reactive.messaging.Outgoing;

@ApplicationScoped
public class PriceConverter {

    private static final double CONVERSION_RATE = 27.84;

    @Incoming("prices")
    @Outgoing("my-data-stream")
    public double process(int priceInNtd) {
        return priceInNtd * CONVERSION_RATE;
    }

}
